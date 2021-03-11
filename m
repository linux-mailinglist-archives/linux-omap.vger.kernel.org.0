Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C853133731A
	for <lists+linux-omap@lfdr.de>; Thu, 11 Mar 2021 13:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhCKMw0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Mar 2021 07:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbhCKMwZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Mar 2021 07:52:25 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C567CC061574
        for <linux-omap@vger.kernel.org>; Thu, 11 Mar 2021 04:52:25 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id h82so21546537ybc.13
        for <linux-omap@vger.kernel.org>; Thu, 11 Mar 2021 04:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=d6lLZUUWVDy12UEvMhTaozfmARby8mesCbzTyHNxBJw=;
        b=bTb55ln8zKdzA/YJce+LgkUMmSlpu0kGY85dhVCf9qkvl60LqciASKGLeDcmPyRt6P
         f9dyBYc2GKa1gwsuWTM4vXLy/gV7Oeskxjbonu7LomjCJ8Z32xD84BWcx1MzbZEzg2L2
         JeXiXbLtKGApFJmu4TophQ6uLdu5qOonyHVYprJilDYvG843FUt/rM8z5rmhNRshV/U/
         i0lazTVY9rjqIaS0hjbO8IYBWGxFeQj8FE0d3gkNcagFPgyihXJIOllkOhMGHlpoSsiz
         TQ8xSeGnjiT91AYLJDrfoLHEPcwe0CGJHKrWK4O148bHc5bTjjQ/QRWvhavKpF+hC0EN
         1bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=d6lLZUUWVDy12UEvMhTaozfmARby8mesCbzTyHNxBJw=;
        b=LsdK5W5T0KakNzMv3v7N4W72DNEVymvDCOmz+g+IA/qw0BdNU205k+NiGRGnhUO3p4
         jYhUeLabetUe84vxwdrdcv7d5XGlviQyzEH25zYBn16XowZ3h29QFPJtcvluQ5rW5SRW
         uPH68t/gZ+H73YAMfAhYIkcL5MEm+f1k+RFI2BfpjQPe9ClHAgkOwG6Pbe+XTcb2AvR5
         7Bn/8SzVx7cwaCDOYRaibnYn3mHCu1zOBhwdWBX7AG0NJ6/VPtn1L4YOgaJRhMFCGRTF
         l3c1A1G5pfTyILVRtxHVcUh/t7Z8iNDpxElCBxyfqBrQC3+NpPsVwrw7nzXCAjAhHL7w
         drZA==
X-Gm-Message-State: AOAM530SOyABuEc4cczXe9DoenpaRHXSY6mInP22JYHRIhpAxAWiSW3a
        3uNdq8alFxJ9qKdr8cv3dabk97yEp0dIwdlFVntcR3n6LzolCPMVf3yvOg==
X-Google-Smtp-Source: ABdhPJz/VvbqlrJq/fb7K2tkUcWkcA3Rk6GcO/YDQnOqQGfEnmzneE/XV3uafqv1qHjhnZJM4CZiyoIZ0vBuG3ISm6Q=
X-Received: by 2002:a25:e74f:: with SMTP id e76mr10834281ybh.421.1615467145005;
 Thu, 11 Mar 2021 04:52:25 -0800 (PST)
MIME-Version: 1.0
From:   Mighty M <mightymb17@gmail.com>
Date:   Thu, 11 Mar 2021 18:22:14 +0530
Message-ID: <CACLAQJGnXvd2Pk_BWH9n2ZZdWNC0FeTDwvHZ91wAJ=rTMQHc5w@mail.gmail.com>
Subject: Display not working on omap4430
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have been working on Samsung Galaxy Tab 2 mainline, it uses omap4430
processor. But the display doesnt seem to be working, backlight is
fine but the screen is blank. Here is the dmesg
https://pastebin.ubuntu.com/p/SY9kdPY9Rd/. The error seems to be clk
mismatch, but i have no clue on how to fix it. Regards
