Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C936D615C
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2019 13:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbfJNLdF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Oct 2019 07:33:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbfJNLdE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Oct 2019 07:33:04 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D7A2206A3;
        Mon, 14 Oct 2019 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571052784;
        bh=FSljipgj28Jh531QTYWyNWy84keWUIqkOhpaU8aRBic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7wNMYV2ne00JOhb796Z8tyUFSjnyzPW6imfoRacHOloX0vYCqWJieivDji1GxSb8
         cib3dPUITid2TtczHaYgqz58cRQ2fKGO2SNTulJsfhGDP94nzGxD/jBXRebRqlVOU1
         jeA9+zacLu4ynvmPM3ep/VDk+wZonBk2sbUg2RiY=
Date:   Mon, 14 Oct 2019 19:32:41 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 06/10] ARM: dts: imx: Rename "iram" node to "sram"
Message-ID: <20191014113240.GN12262@dragon>
References: <20191002164316.14905-1-krzk@kernel.org>
 <20191002164316.14905-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002164316.14905-6-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 02, 2019 at 06:43:12PM +0200, Krzysztof Kozlowski wrote:
> The device node name should reflect generic class of a device so rename
> the "iram" node to "sram".  This will be also in sync with upcoming DT
> schema.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

Let me know if you want it go through IMX tree.

Shawn
