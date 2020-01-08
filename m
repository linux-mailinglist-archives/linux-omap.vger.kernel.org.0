Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8E3B133978
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 04:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgAHDOV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 22:14:21 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52187 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgAHDOV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 22:14:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id j11so438211pjs.1;
        Tue, 07 Jan 2020 19:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wapcydPDKs4ATem7apogb2hwKUnmiMIRnx3wrHpv2Vc=;
        b=O3HrivJtS3/D7TbOQGFmc/mSrnFXLWLOzXw1jM+kt9NJvt9u/hyheDVxQc4faygvuV
         pT0FDJmIhw9jBxZZPoef8ihqTmJ8dvNKkYM4hZnP6VgK/MdGk4FG76nsShQD97dqMgIZ
         ihwrN7DQ1ujbCw+ip0aacDW+yfx4aCMPyV01JjCu2sySe265uc+1U76YsWG9TDRRrVx1
         LyITyWX6VbaDDJoI2+zak3GdIHfoyE+QlZgbsZ6NLW7YGEwGPjHsBCeDf/UaNGHr0G0Y
         CTAaRuGHxy7RZ9mBYNsAZ7tLMK+hf0U9AVtzMWdoIEC/w73dumleUSvdg1OVYFd0xlYz
         bWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wapcydPDKs4ATem7apogb2hwKUnmiMIRnx3wrHpv2Vc=;
        b=nprUq6qj8r1AmPwcmhzzDs1IrWs07dG4RmYdFFVf0tsil7j928kkSm677j0ERGLBds
         6PI4GsYxdCcW2vt0R5m3agphnU9MIdzogkkiSyyaMO7hDOTnk802RrcjJ8M/SRANEUTA
         wqnxgk6JNR3TFIqtg4hoP+djGfx/vC55X6zKKYTw2PyMXdjyBBfkm8yzF/YjGLp1hauF
         ruyjFbjJQdydtNHPXhXuKVxWLbQVBWrkJRowqhb99JxFVrK4tHO+9TdROy01xQLcIeSm
         DMgyTCHVJevJRuZXdzdvVKBM1ClsAKmCQ2ncFqcvpNUJ1uSSZU6IHH6C80WE3iIkqQ2+
         a2Zg==
X-Gm-Message-State: APjAAAVYcnc/F+WAmTApZkPn2uaE+3j8yJyH7juMyV2JBXiu/5nOg3eD
        MBT+D/cBG9FBl9ODpftcVnQ=
X-Google-Smtp-Source: APXvYqx+Nw/Lo5aIDKHl9GWfOQYR6/m7RxfgS//7jObuZQoJnwUx0dYwcKVnx2860czW2WXdFCs1rg==
X-Received: by 2002:a17:902:a503:: with SMTP id s3mr2984667plq.274.1578453260832;
        Tue, 07 Jan 2020 19:14:20 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z4sm1016811pfn.42.2020.01.07.19.14.18
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:14:20 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/3] Some improvements for OMAP hwspinlock
Date:   Wed,  8 Jan 2020 11:13:58 +0800
Message-Id: <cover.1578453062.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch set did some optimization for OMAP hwlock controller with
changing to use some devm_xxx APIs to simplify code.

Baolin Wang (3):
  hwspinlock: omap: Change to use devm_platform_ioremap_resource()
  hwspinlock: omap: Use devm_kzalloc() to allocate memory
  hwspinlock: omap: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/omap_hwspinlock.c |   45 ++++++++++------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

-- 
1.7.9.5

