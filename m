Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D620A36F6B8
	for <lists+linux-omap@lfdr.de>; Fri, 30 Apr 2021 09:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhD3HuM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Apr 2021 03:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhD3HuI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Apr 2021 03:50:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71DEC06138C
        for <linux-omap@vger.kernel.org>; Fri, 30 Apr 2021 00:49:19 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 124so27743715lff.5
        for <linux-omap@vger.kernel.org>; Fri, 30 Apr 2021 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=vCfKmaxmx3AW+p6Sln7xVZ2KanlN/bUsf3TpJiUYzDk=;
        b=Ev1mSGozKVKnH+Oz8ZmCxgx5vxZecHe2v/9VM72Jmn5Q4MyWIbZuORL8dTtLeKlcKI
         VG98pFOl+Z7zOtFcR26Zr/4zDweL32aBWe8hvCvI5fh7RH/6z438hYtqsoZ0yF26uRwy
         edakEEAAky1U8MGHYw7yM2IFHLw4yPyO3icy+bK/bb7mx0I/uraNU4Py6I39S7bzSYqV
         leqaLW0zjJXJ7zke/BKbya6SpeZVX5amtl7Kngjv23H3p4c3DNiEGvKCMiGCEJuyezGz
         LNP2Fe+0yZR951Q9MXbF6krN2sRTVKuisKMnlCd8phSt8SQv4x+QMY6CAQv4sm4kyT3E
         yITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vCfKmaxmx3AW+p6Sln7xVZ2KanlN/bUsf3TpJiUYzDk=;
        b=O1n0PoRV2jmBC74RRDn2kekRxYgYw9+1NXygiU6E1SOk6/cwTFTFCHW9CW6DAiI7ba
         vOddAqg+JjjrVxmBO4HxYa2kK0zBzkPuwbHF5UaxVhN2rPuOt96TPrrSFHdQUvGK3EjH
         Vujrxp4+le+jdZ/XBwzqaUcYmOmxc48pCXwQDsAcyDJgmDH0Nf1w4znjnen+KFWIRTr8
         /juoDYN3GWlTXbEUZWc64rho1WI+0wTFcIy2H4z55Az11GDrr4vvzWlHokOYJvX2qT5H
         qJknS7Y0ghOU+FBzYSAe7ntRMAJSYT7VXg9u+AfniGe2ItPLlomlolU25Kvit99RGLge
         p+9A==
X-Gm-Message-State: AOAM533pC1MJbIEbNFwjrsP+Lzt/TAgIOBnHMRcmS2QspmQzsYgXhI8p
        5XNCPSIG8GqCmGnKqB9WXS4yhXD7eHWPTnpgvxxyOUypS2G0qQ==
X-Google-Smtp-Source: ABdhPJzBUoxJ52aL6OYFhV4hYlau6IzQ2JxcBgkbScw5Vx2S+sXFJuRu/fSDtcvxPEDPGDyiJINu78yH6YlkCrJtZpc=
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr2437341lfm.203.1619768958128;
 Fri, 30 Apr 2021 00:49:18 -0700 (PDT)
MIME-Version: 1.0
From:   Mighty M <mightymb17@gmail.com>
Date:   Fri, 30 Apr 2021 13:19:06 +0530
Message-ID: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
Subject: Performance difference in mainline and downstream
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have a Samsung Galaxy Tab 2 which has an OMAP 4430 clocked at 1Ghz,
with that there is quite some difference in performance when comparing
the mainline and downstream kernels. To confirm my suspicions I ran
UnixBench(https://github.com/kdlucas/byte-unixbench) on both of them,
the results are as follows -
1) Downstream (running SailfishOS) - Kernel Source -
https://github.com/CyanogenMod/android_kernel_samsung_espresso10, I
get a result of 580.4 in dual-core and 292.9 in single core. I
compiled UnixBench manually.
2) Mainline (running PostMarketOS) - Kernel Source -
https://github.com/MightyM17/linux_openpvrsgx/tree/letux-pvrsrvkm-5.12-rc1,
when using UnixBench package from PostMarketOS repo, I get a score of
352.7 dual core and 192.7 single core, and compiling it myself and
then running gives the score 415.1 dual core and 209.9 single core.

The downstream scores are quite high even beating Droid 4 which has
CPU clocked at 1.2Ghz when Tab 2 has it at 1 GHz.

Why is there so much difference in mainline and downstream and what
can be done to improve the performance.

Regards.
