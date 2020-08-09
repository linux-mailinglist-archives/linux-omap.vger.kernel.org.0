Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F3523FC28
	for <lists+linux-omap@lfdr.de>; Sun,  9 Aug 2020 04:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgHICTO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Aug 2020 22:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgHICTN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Aug 2020 22:19:13 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A390CC061756
        for <linux-omap@vger.kernel.org>; Sat,  8 Aug 2020 19:19:13 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id g19so5618230ioh.8
        for <linux-omap@vger.kernel.org>; Sat, 08 Aug 2020 19:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7EcW0mScIlp/zg2Q1CqnvBVn0LiiWY+U+fN8Zo/bqz4=;
        b=Jai/SISQ+1oqdx7YCW5FlUXrqXKqPdU1wggeaf6E9J3EsLfnxx/2p0NQa3wcx9AiP0
         QG39qT/AVJ5RfSEltLQozEsM3xiEo+8dKLCoz0CveYR9y21keWM/rAF41TaOTGNosrUA
         +DsudypkjuJJ1Ob6oc//ICYB2IkgfIbAj9sTvWftb9PKaeDbWqguQ93WF7VOKwELwuIB
         dMylXBLOcM3fMtoVpLzLW9t69Kdd97Xccw03aRlIB7A9WOjVz9bRD7lsdE5vEAt+XTtR
         qN2k9b3VnDHnTAaSjHR3SOzp8jeY7O8GrBG6zHC/b7Rydx2EeCQJ7VDFLx87zVJh8R6s
         i++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7EcW0mScIlp/zg2Q1CqnvBVn0LiiWY+U+fN8Zo/bqz4=;
        b=KFiHb5WD1H9ZYKDFN4SdTsPySsJKD0yEQLG69dZGmWYqnfxtDJNadDLrXqK0qEHSGM
         NfIxUXF6Bdh3V0wGbrZMFHxnWbe/BXHdeskATDmMRF3eB13gntaZenMclnhXEJvjsZuB
         lOCHvRX6Xt1mNBww3V3agn3Ssfo0eXYjAJMSlSBh3HUhWZpSzkccWoxfYk1cXJF6L5Kn
         bt4ulX3UDtjOXkXZcvEtmz+yayq9HrIki8Y7DLDoxMZqrh7gNCI2c9iORWjTnpDw2pax
         b+sb42xIBDKmvstJH8yLFvCaoz/xYhDL3rPimCHikxysvW6CXWWKNH0fuvkrgD37BhZ0
         TYEQ==
X-Gm-Message-State: AOAM5301dUQ/E+BNMrHVnuGXPJlboQHD/SKqlaKn7qZzqAvWkb5rhZK3
        MqiGMmQJRIHEVAofeDpnAdQKFGY1EZdFHTaSdWH0YIlG
X-Google-Smtp-Source: ABdhPJw51SBXZXiVAq8PfVFIPfo/8IQIwN5/vykapYULmzgR1ahk8uCnDIyMKFy+is4rvPz1hO/BnR5I1ULEsybscOU=
X-Received: by 2002:a02:7786:: with SMTP id g128mr12389635jac.45.1596939550734;
 Sat, 08 Aug 2020 19:19:10 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 8 Aug 2020 21:18:59 -0500
Message-ID: <CAHCN7x+LNe43P7qUdzXJjEbzNS5GAo6yfg_Rg=_gLhA0omPUng@mail.gmail.com>
Subject: OMAP3 Gstreamer kmssink DRM failure (5.4)
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am trying to configure gstreamer to capture video and display it to
the LCD on a DM3730.  I have the camera capture working, but the
problem appears to be DRM related.

I am able to stream video to fbdevsink, but it doesn't appear to route
to kmssink.

When I run modetest, it shows the following:

Connectors:
id encoder status name size (mm) modes encoders
45 44 connected DPI-1          105x67 1 44
  modes:
name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  480x272 60 480 483 525 527 272 274 285 288 9000 flags: phsync,
pvsync; type: preferred, driver
  props:
1 EDID:
flags: immutable blob
blobs:

value:
2 DPMS:
flags: enum
enums: On=0 Standby=1 Suspend=2 Off=3
value: 0
5 link-status:
flags: enum
enums: Good=0 Bad=1
value: 0
6 non-desktop:
flags: immutable range
values: 0 1
value: 0
4 TILE:
flags: immutable blob
blobs:

value:
20 CRTC_ID:
flags: object
value: 46


There is more but I think that's the connector-id that I am supposed to use.

I have been trying to force the connector ID with g-streamer:

GST_DEBUG=2 gst-launch-1.0 -v v4l2src device=/dev/video6 !
videoconvert ! kmssink force-modesetting=true connector-id=45

Unfortunately, I get an error that shows

# GST_DEBUG=2 gst-launch-1.0 -v v4l2src device=/dev/video6 ! videoconvert ! kmss
ink force-modesetting=true connector-id=45
Setting pipeline to PAUSED ...
0:00:05.130981445   251   0x115f20 WARN                 kmssink
gstkmssink.c:835:gst_kms_sink_start:<kmssink0> error: Could not open
DRM module (NULL)
0:00:05.131469726   251   0x115f20 WARN                 kmssink
gstkmssink.c:835:gst_kms_sink_start:<kmssink0> error: reason: No such
file or directory (2)
0:00:05.132263183   251   0x115f20 WARN                basesink
gstbasesink.c:5367:gst_base_sink_change_state:<kmssink0> error: Failed
to start
ERROR: Pipeline doesn't want to pause.
ERROR: from element /GstPipeline:pipeline0/GstKMSSink:kmssink0: Could
not open DRM module (NULL)
Additional debug info:
../sys/kms/gstkmssink.c(835): gst_kms_sink_start ():
/GstPipeline:pipeline0/GstKMSSink:kmssink0:
reason: No such file or directory (2)
Setting pipeline to NULL ...
Freeing pipeline ...
#

It appears that there is something missing for DRM support, at least on dm3730.

I get the following message while booting, but I don't know if it's related:

 [    7.279083] omapdrm omapdrm.0: DMM not available, disable DMM support

Does anyone have any suggestions?

adam
