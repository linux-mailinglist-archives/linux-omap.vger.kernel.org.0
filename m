Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218D8112773
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 10:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfLDJcK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 04:32:10 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41602 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJcK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 04:32:10 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so2928719plb.8;
        Wed, 04 Dec 2019 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wapcydPDKs4ATem7apogb2hwKUnmiMIRnx3wrHpv2Vc=;
        b=ezOeH3YYam2iUzv7wncBkreQa5cVfhsq88wp5aX7kHDawBuYAyk02wiajKY/a3tYZf
         nqZH5CS0cD5Z9XL9uyNsr4SONOZaqWfYHBI+5ds/PXu/WEqRaFSMxWXiY2UkFaQiDPv2
         WyxMGf8e6L4nnM0SYrLWDlP+NkhLChoNycut0X5Eh1rNsAr7Cx4pkelmwJ6bTKm6I4ew
         Gus02MFRm/t8pyNWchfUL+2CaaEJJrxrbbma1XmKuk3Le94kxxHm+WUk62zmp9goiF43
         MqaVirKdj2CV9KSVKJYb027BHx01/jnolBp60CX66F/6sC+Lehn0fovuCV2TZ/2ualxl
         wq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wapcydPDKs4ATem7apogb2hwKUnmiMIRnx3wrHpv2Vc=;
        b=l4CCM3q7zyGKo5Cpiooy6zsmbEBCYK3pX90vP3WhE1t3Lpp5qmNx3e5CM9ACbuhNFb
         snme/a/Q81cVgcFx9KrNZmkpfzojzRC+06czvEJbgADPWXI5zAxuXK+F2jatXreK3tDt
         7N9i+t8fSgV0UIxwTwIRX5mXqP/0uo5RMlT7qmOnr7v8rcXt/ykRC5A7mtIowcD9UKSg
         XoA0E+zlulamCQXw6IpGtVHlKttnXid/TzNz8bXmS61Onv1Kx5Z+m5U16eT2SgDwFUO0
         tUhcksLrbq6m9wDUxsgQOXFus3fiO8HFMF7gHaBVEXlQ0SBWKGRSAMdns/9EAyrLFobO
         6rBA==
X-Gm-Message-State: APjAAAUxxtlvIrQl5WBVqr54z0P6UYnJiLZT3V5vhBwlNEHGD3NNmFau
        9bP8XqvwEOAgQ0LWkFjywD0=
X-Google-Smtp-Source: APXvYqyNYdgVXBoEpnbiHKkCqyjVhkl9ihFNqVY0Nj8cxidpirtNd/dNbz+JiJz5+xZEBMaslDtqsw==
X-Received: by 2002:a17:902:fe98:: with SMTP id x24mr2471710plm.155.1575451929660;
        Wed, 04 Dec 2019 01:32:09 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 91sm2380086pjq.18.2019.12.04.01.32.07
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:32:09 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Some improvements for OMAP hwspinlock
Date:   Wed,  4 Dec 2019 17:31:28 +0800
Message-Id: <cover.1575451463.git.baolin.wang7@gmail.com>
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

