FROM dunefro/py36:v1

RUN yum install libSM libXext libXrender -y

RUN echo -e "import cv2\ncap=cv2.VideoCapture(0)\nwhile True:\n  ret,photo=cap.read()\n  cv2.imshow('video',photo)\n  if cv2.waitKey(1)==13:\n    break\ncv2.destroyAllWindows()\ncap.release()" > /root/video.py

ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1

CMD python36 /root/video.py
