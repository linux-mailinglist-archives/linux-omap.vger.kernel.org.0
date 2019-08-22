Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 934E5988E0
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2019 03:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfHVBOz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 21:14:55 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:40390 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729135AbfHVBOz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 21:14:55 -0400
Received: by mail-io1-f53.google.com with SMTP id t6so8541548ios.7
        for <linux-omap@vger.kernel.org>; Wed, 21 Aug 2019 18:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Syx7E/9EskBTI6VMuAkVOzDdJsm1lq8VwC+GRl8q5YA=;
        b=rgwa2WUk1nPPTQVv1TFNG4O2prvwhzgkWnK1o8MldvQABj54glJmb6uTXIHI+L01Cj
         4aHdXCb70H/5PNu12CS+0OO0T7uCZSvulx1oGLt/cnT9GJp8iynld5M4BFm8mK7ThUh5
         /N4YT8DtpxoiHnsjSew9QJleunwPJ4IdyAuOO50hbqH0KHM/Prs9iHsOVtuneTHA0yTq
         89TSYB4qRRXpUdlvWpYWTfdN57VPVfHJzcGCuw31xuiWt9nby0ASXAW/KAfj/q1K8WoS
         XXarpHJQ0z8nPbMYzOlOrGWobxDKZqI3AiqAUYqZyfLXtSOOOTxf7l1aUxEJqx3qtJP7
         g2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Syx7E/9EskBTI6VMuAkVOzDdJsm1lq8VwC+GRl8q5YA=;
        b=Qop12JsQYdBA3CGzVZ8kIQ543V3+/WAHEMnNZuY4o5newwuVLiZ0gRZi+May1Db0WT
         uF6ZpPSa6g51ILIIeKMHkDUUBkAuh3m0S6es4g93ahxqKHfXQbIEt0b5moi4kOd+YwyY
         +TYFhKWkAuaXqA+lboDDPGkkFkY+AktryVe3tLmC42pk3fQ2mcXQUHptgQQVOhHU+LL8
         jnoSUhvpIcmOpqV2+pjFRDz5S7gpM+M8+9HNBBMiGB6bMPphHsfS1o/PELVEvNCN36Gi
         VL3Winm6MUQ+n+W2GBhNaE/BY6vRtjeEpZFcyFf80qXoln6odyJfTRv08FEsTWyTuCtV
         K3xQ==
X-Gm-Message-State: APjAAAVYU8yZ1sz04Ow9oV4YgAGxB99sZ5C+RcklwuTTbQzomGDIBmxS
        IP1Q0eEAP7ubaFW95KVWCa83osH5pphFKolDNnR6JKobLQ8=
X-Google-Smtp-Source: APXvYqzx2mp/KQiCCf+aXSndTgDGxgghtO12D/vHVYiCdDc2yb8DvVwru/Xezm7XIV9BcnMEQlL35K7Rxrs4kC4kVAo=
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr9831885iof.276.1566436494277;
 Wed, 21 Aug 2019 18:14:54 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 21 Aug 2019 20:14:43 -0500
Message-ID: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
Subject: Question about drm/omap: Remove panel-dpi driver
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I know it's been nearly 9 months this this was removed, but for those
of us who still define our displays in the device tree expecting the
dpi-panel, we're not getting video.

The commit message only states:

    Panels are now supported through the drm_panel infrastructure, remove
    the omapdrm-specific driver.

It does not give examples of how to do this, and I feel like we should
have been given some warning or indication.  Is there an example I can
follow for linking a dpi panel into the omap DSS?

adam
