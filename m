Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE0834F8E2
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 08:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhCaGlx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 02:41:53 -0400
Received: from muru.com ([72.249.23.125]:49186 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233814AbhCaGld (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 31 Mar 2021 02:41:33 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AEF9D80C3;
        Wed, 31 Mar 2021 06:42:34 +0000 (UTC)
Date:   Wed, 31 Mar 2021 09:41:28 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove obsolete OMAP HWMOD DATA FOR
 OMAP4-BASED DEVICES
Message-ID: <YGQZmIsbXnuIX5S4@atomide.com>
References: <20210318172520.6634-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318172520.6634-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lukas Bulwahn <lukas.bulwahn@gmail.com> [210318 19:26]:
> Commit 2584d7e7f87a ("ARM: OMAP2+: Drop legacy platform data for omap4
> hwmod") drops the file ./arch/arm/mach-omap2/omap_hwmod_44xx_data.c, but
> misses to drop the now obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES
> section in MAINTAINERS, which refers to only that file.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:  arch/arm/mach-omap2/omap_hwmod_44xx_data.c
> 
> Remove the obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES section.

Thanks applying into omap-for-v5.13/genpd-cleanup.

Tony
