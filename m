Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D48298D81
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 14:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1776588AbgJZNK2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 09:10:28 -0400
Received: from muru.com ([72.249.23.125]:46780 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1776516AbgJZNKL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 09:10:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 74E4080AA;
        Mon, 26 Oct 2020 13:10:15 +0000 (UTC)
Date:   Mon, 26 Oct 2020 15:10:07 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/18] Drop remaining pdata for am335x and use genpd
Message-ID: <20201026131007.GB5639@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [201026 11:22]:
> With the related driver changes, we can now drop the remaining platform
> data for am335x for v5.11 merge window and probe using device tree data
> and genpd instead.

FYI, I've also pushed an initial branch for testing with all the patches
applied to [3] below.

Regards,

Tony

> [1] https://lore.kernel.org/linux-omap/20201026105812.38418-1-tony@atomide.com/T/#t
> [2] https://lore.kernel.org/linux-omap/20201026111049.54835-1-tony@atomide.com/T/#t
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.11/genpd
