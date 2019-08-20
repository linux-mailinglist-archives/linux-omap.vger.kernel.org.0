Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE32496247
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 16:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbfHTOSr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 10:18:47 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:38626 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbfHTOSq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 10:18:46 -0400
Received: by mail-io1-f53.google.com with SMTP id p12so10059495iog.5
        for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2019 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=kVsX9kA6AqN0alHpADZAek+syso/Nvl2MnFxkHBfX2M=;
        b=F4LU5Yws/zzFZ3lEMsrBbRJseZsZ+RgBb1gb5yiyIGTkeTafR4fJHOcbG5ho9nLgQ1
         Ss5x7u+lIkD8MEHR2CzOiH/EnTa/gjf80QcclPXPeqEHdHPeaQ3x6kd/I1JjQUDTM4Ks
         Jmer6NW570piN2qgRynn0j0d/WPpIgMOcbpHt15tH18hB97q18XnZRJf1Ulujs/zF19j
         vYk0/AqvLbOxlXctecYHHusDpWH+o5n9ZZ8gjwN97TkdIBo8yQfH9MV4F7s9Z33AgJHv
         SpQx0sIXH76jWhiTLcFxsOQt5QSUvFH3N9S7t4Di7ObeVLNbPLhGqmeiEqDkr3sO//xk
         gzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kVsX9kA6AqN0alHpADZAek+syso/Nvl2MnFxkHBfX2M=;
        b=tpFvEx/LMQleBAeZk6QbgL5+Md4qjHGzD/GpTK8XRhqE6VjSgh+jdnsc3RKb3QWzMA
         jPEIaTEjDQKh7qjZBjSiXy9dgoC6Ffxe5E3u8aCNusN3hqC0x9ecwOcdlwZQuH4KxPU+
         IdKXIExHq1mJ7mtj9gkB1JC13HESZUG4m0UWLA7FBQNCthlrFr8ckm+iiqHKnwnIa0MV
         vWL+qWqwC10CJaqtbWdIHst+dWLW7bHoDCB01BjgvEnhSwRnX6FN0Y0e92tqYDdzVncM
         xOASAcppYpuQuKz7ZCTKQJVykgSDhC6Bzk7dKxfvPLShk9ItZRFEi7OBZR3K9AD74iOq
         R1gg==
X-Gm-Message-State: APjAAAU7YQPpQShWD+jcMGBKFhFp2moEZ4ckh7ngofoL3JRITZMgXrnq
        OX12UwobZ0y0aiJcLmjwWzAvDA/8FKAA+q9KOt5H16k1
X-Google-Smtp-Source: APXvYqyByjT6qAmDgWZD2JMEsE1TeUXu3l9Uy+dfjkO3ORbiKRx2jk3zMAPpowwYMp9ReXT4+tjfyPtNaRELOXsONi8=
X-Received: by 2002:a05:6638:c8:: with SMTP id w8mr4081926jao.52.1566310725323;
 Tue, 20 Aug 2019 07:18:45 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 20 Aug 2019 09:18:33 -0500
Message-ID: <CAHCN7xLNFp4FVKDfmGFnKxiVMNR=3HqaNsUmXkLKCJ40=y7iUw@mail.gmail.com>
Subject: omap-sham and omap-aes missing hwmod/dev_info
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In older versions of Linux, I was able to run tests of the AES and SHA
engines, but when attempting to load these save drivers in newer
kernels (4.19+) on a DM3730, I get errors.

[    0.469701] platform 480c5000.aes: Cannot lookup hwmod 'aes'
[    8.033870] omap-aes 480c5000.aes: _od_fail_runtime_resume: FIXME:
missing hwmod/omap_dev info
[    8.043088] omap-aes 480c5000.aes: omap_aes_probe: failed to get_sync(-19)
[    8.050204] omap-aes 480c5000.aes: initialization failed.

[    0.510069] platform 480c3000.sham: Cannot lookup hwmod 'sham'
[    7.900038] omap-sham 480c3000.sham: _od_fail_runtime_resume:
FIXME: missing hwmod/omap_dev info
[    7.909215] omap-sham 480c3000.sham: failed to get sync: -19
[    7.914982] omap-sham 480c3000.sham: initialization failed.


Does anyone have any recommendations for me on how to go about
enabling these drivers again?

I was trying to replicate the info found at
http://processors.wiki.ti.com/index.php/Cryptography_Users_Guide#AM35x.2F37x.2C_AM335x_-_AES.2C_SHA.2FMD5_Drivers

Thank you,

adam
