Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C75B369D4
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2019 04:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfFFCK6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 22:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbfFFCK6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 5 Jun 2019 22:10:58 -0400
Received: from dragon (li1264-180.members.linode.com [45.79.165.180])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 943F920717;
        Thu,  6 Jun 2019 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559787057;
        bh=1wV4ExVvlN5EgzNFrCwIfBYS4g4614HuuxSdiSYaE/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iaBgjkWHvEUB8xTxgpH7CYMJSqAEFJfcmI6o0nb7AXcneh+zDM86Ycr7Dgq2kb6yz
         mmwwCHGq64fFLsorar9SPLF5AZaKCC1oM+7C3300P/f7k+roVd1FB3O9wi4YsBL8w9
         X2EyQoBRKcUrQF+WyBrJQ4Y6VrM9A4SyL2ECfOYQ=
Date:   Thu, 6 Jun 2019 10:10:32 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] ARM: configs: Remove useless UEVENT_HELPER_PATH
Message-ID: <20190606021027.GV29853@dragon>
References: <1559636093-26005-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559636093-26005-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 04, 2019 at 10:14:53AM +0200, Krzysztof Kozlowski wrote:
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> 
> Changes since v2:
> 1. Remove unrelated files.
> 2. Add Geert's ack.
> ---
...
>  arch/arm/configs/imx_v4_v5_defconfig      | 1 -

Acked-by: Shawn Guo <shawnguo@kernel.org>
