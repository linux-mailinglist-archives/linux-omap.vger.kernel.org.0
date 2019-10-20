Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15150DDEF5
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJTOpj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 10:45:39 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:36637 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfJTOpi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 20 Oct 2019 10:45:38 -0400
Received: by mail-il1-f179.google.com with SMTP id z2so9676735ilb.3;
        Sun, 20 Oct 2019 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=KrDu/vgLItB32vm1EEP3scGbUZAePkFvEAZ1zExbevU=;
        b=btkQgoY2dLnQkK3Glw0Lhic8heYwIRFyPei2+ExctEKWGhczB07QtdKlHbSUDLy5Qg
         Glgx10NLwXuD5t0flI1hwe7aZm7TG2WR4dWz5UmbTHaGcQVNQAElzqsqo/Pf+GW2/mBD
         dDbFvixCitFvdM7ol0kKqDeDG9jsaz7zYJrShoL3NcfWVQsyKplnhVQXk31ENoztGE2q
         8Hs11zj72YBj1ZdjYuXaX0DltmhV5nJ6w+h9DDo54kllpQQwUtXXeeCAcuc4WYAb89dA
         4IsR/Glvs9awxysIGPw/IL6hFEM69U2t08ksM9xWYAqvqVIVHMmRaFa+HbyF6pC9QWs3
         0Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KrDu/vgLItB32vm1EEP3scGbUZAePkFvEAZ1zExbevU=;
        b=I9LiDBYuhajUFmTI0IE0MxPn5RgT/oKseckhbRNev3l5tNcwB7DVBBksukIFiL2Rjk
         WcT6QNjKslQ8QKdyhDQtkoaT7NDLoIKp1rdE5JJuQY9Unqta6YwXkKh1oXxNX/m+KBfd
         Z/+dxrJdlZjkmjM5YH2ZwHU9SoQj+I1d1fPDnwhK2xBzHeTzNnogrrGNKlDhxLn9um5a
         qqL8BvNOW4HZSiY7fzWI0UdOFEOEmdgETnIFvupVRFVzDkyNBDJr3xv5BGaZ8DshsW0d
         SJ0fOR8cxlmqYCChigMcs/JKU8eR02yXbI9gqyjjpJ4Ya0lJ/UKxgRoWk0INhWUH3Cw7
         J8IA==
X-Gm-Message-State: APjAAAXFHEgB2AXyqaSlYvGUfHbSL6ZGPdnuuSP3EhJJSYL611M5HAwi
        afM/4NeAHfNH5aLcbxM1UShrc7hG74IpCSZG4KQhcjZT
X-Google-Smtp-Source: APXvYqyBm2F86GArGiEOwwTNqv6zY40Tq62euFyQZ4c+oktCAZbRneHxT9PWMBSxS1xjaWIZBUX0ajPa8cD8eJDBr7w=
X-Received: by 2002:a92:8384:: with SMTP id p4mr20362014ilk.276.1571582737214;
 Sun, 20 Oct 2019 07:45:37 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 20 Oct 2019 09:45:25 -0500
Message-ID: <CAHCN7xLMTDondeiYiYHwGG5HYEaRwY9S4uoqQ-Eq6b8ksSS+NA@mail.gmail.com>
Subject: V4L2 runs out of memory when OMAP3 ISP parallel pixel clock is high
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am running a DM3730 connected to an mt9p031 sensor, and the ISP is
running in 8-bit parallel mode.

I have the sensor endpoint configured as:

mt9p031_out: endpoint {
     input-clock-frequency = <24000000>;
     pixel-clock-frequency = <72000000>;
     remote-endpoint = <&ccdc_ep>;
};

I was looking through the datasheet, and it appears as if the pixel
clock frequency can go up to 96MHz, so I tried to increase the
pixel-clock-frequency to 96MHz, but v4l2 seems to get an out of memory
error.

libv4l2: error turning on stream: No space left on device
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
gstv4l2src.c(658): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.019073486

Through trial and error, I was able to get push the sensor's
pixel-clock-frequency to work at 90MHz, but no higher.  I have also
tried experimenting with the input clock frequency without success.

If I can get the clock to run at 96MHz, which the ISP and sensor
documentation appears to permit, I am hoping to be able to achieve a
little higher frame rate.

Is there something I need to do to allocate more memory to V4L2 or is
there some other limitation causing the out of memory at higher pixel
clock frequencies?


thank you,

adam
