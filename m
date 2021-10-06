Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743284238DE
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 09:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhJFHbN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 03:31:13 -0400
Received: from muru.com ([72.249.23.125]:41330 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230013AbhJFHbM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 03:31:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BFB6880E7;
        Wed,  6 Oct 2021 07:29:50 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:29:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-pocketbeagle: switch to pinconf-single
Message-ID: <YV1QTrMHRX1VGgaP@atomide.com>
References: <20210825202516.1384510-1-drew@pdp7.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825202516.1384510-1-drew@pdp7.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@pdp7.com> [210826 01:20]:
> Switch the compatible for the am33xx_pinmux pin controller node from
> pinctrl-single to pinconf-single. The only change between these two
> compatibles is that PCS_HAS_PINCONF will be true. This then allows
> pinconf properties to be utilized.
> 
> The purpose of this change is to allow the PocketBeagle to use:
> 
>   pinctrl-single,bias-pullup
>   pinctrl-single,bias-pulldown
> 
> This dts already defines these properites for gpio pins in the default
> pinctrl state but it has no effect unless PCS_HAS_PINCONF is set.
> 
> The bias properties can then be modified on the corresponding gpio lines
> through the gpiod uapi. The mapping between the pins and gpio lines is
> defined by gpio-ranges under the gpio controller nodes in am33xx-l4.dtsi

Thanks applying into omap-for-v5.16/dt.

Tony
