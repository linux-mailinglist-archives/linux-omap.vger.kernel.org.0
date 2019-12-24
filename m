Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A5F12A3F8
	for <lists+linux-omap@lfdr.de>; Tue, 24 Dec 2019 19:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLXSpH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Dec 2019 13:45:07 -0500
Received: from muru.com ([72.249.23.125]:49400 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbfLXSpH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Dec 2019 13:45:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 751A88107;
        Tue, 24 Dec 2019 18:45:46 +0000 (UTC)
Date:   Tue, 24 Dec 2019 10:45:03 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>
Cc:     webmaster@dawncrow.de, linux@arm.linux.org.uk, robh+dt@kernel.org,
        mark.rutland@arm.com, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
Message-ID: <20191224184503.GK35479@atomide.com>
References: <20191224161005.28083-1-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191224161005.28083-1-nerv@dawncrow.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* André Hentschel <nerv@dawncrow.de> [191224 16:11]:
> This is the first generation Amazon Echo from 2016.
> Audio support is not yet implemented.

OK looks good to me, just worried about one part:

> +&sgx_module {
> +	status = "disabled";
> +};

We should have a separate am3703.dtsi or whatever the SoC model
disabling sgx if not there on the SoC. That way board specific
dts files can just include it without having to debug this issue
over and over.

Regards,

Tony
