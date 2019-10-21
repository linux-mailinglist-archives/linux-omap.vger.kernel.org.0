Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93558DF45F
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 19:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfJURha (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 13:37:30 -0400
Received: from muru.com ([72.249.23.125]:38682 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfJURha (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 13:37:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D5C69826D;
        Mon, 21 Oct 2019 17:38:04 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:37:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kernel@lists.codethink.co.uk,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: OMAP2+: make omap44xx_sha0_hwmod and
 omap44xx_l3_main_2__des static
Message-ID: <20191021173727.GF5610@atomide.com>
References: <20191009085646.21755-1-ben.dooks@codethink.co.uk>
 <20191009085646.21755-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009085646.21755-2-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ben Dooks <ben.dooks@codethink.co.uk> [191009 01:57]:
> The omap44xx_sha0_hwmod and omap44xx_l3_main_2__des objects are
> not exported so make them static to avoid the following warnings:
> 
> arch/arm/mach-omap2/omap_hwmod_44xx_data.c:793:19: warning: symbol 'omap44xx_sha0_hwmod' was not declared. Should it be static?
> arch/arm/mach-omap2/omap_hwmod_44xx_data.c:977:26: warning: symbol 'omap44xx_l3_main_2__des' was not declared. Should it be static?

Applying into omap-for-v5.5/soc thanks.

Tony
