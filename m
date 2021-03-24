Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D290D347759
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhCXL2q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:28:46 -0400
Received: from muru.com ([72.249.23.125]:46418 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232696AbhCXL2S (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:28:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D73818057;
        Wed, 24 Mar 2021 11:29:09 +0000 (UTC)
Date:   Wed, 24 Mar 2021 13:28:09 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     khilman@kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: omap2: Replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <YFsiSVIAKasemilJ@atomide.com>
References: <1612237411-115179-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612237411-115179-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jiapeng Chong <jiapeng.chong@linux.alibaba.com> [210202 05:43]:
> Fix the following coccicheck warning:
> 
> ./arch/arm/mach-omap2/pm-debug.c:171:0-23: WARNING: pwrdm_suspend_fops
> should be defined with DEFINE_DEBUGFS_ATTRIBUTE.

Thanks applying into omap-for-v5.13/soc.

Tony
