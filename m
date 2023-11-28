Return-Path: <linux-omap+bounces-45-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66597FB43C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 09:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F8B28244C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 08:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9799D18040;
	Tue, 28 Nov 2023 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FC62693;
	Tue, 28 Nov 2023 00:32:48 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r7tWN-006nqK-HF; Tue, 28 Nov 2023 09:32:43 +0100
Date: Tue, 28 Nov 2023 09:32:41 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kristo@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Message-ID: <20231128093241.707a4fa0@aktux>
In-Reply-To: <7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
References: <20231127202359.145778-1-andreas@kemnade.info>
	<7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 09:00:16 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> > +required:
> > +  - compatible
> > +  - clocks
> > +  - '#clock-cells'  
> 
> reg is required. Device cannot take "reg" from parent, DTS does not work
> like this.

Well, apparently they do... and I am just dealing with status quo and not
how it should be.
Look at commit 31fc1c63c2ae4a542e3c7ac572a10a59ece45c24
for the reasoning of not having reg.


well, look at drivers/clk/ti/clk.c
ti_clk_get_reg_addr();

...

       if (of_property_read_u32_index(node, "reg", index, &val)) {
                if (of_property_read_u32_index(node->parent, "reg",
                                               index, &val)) {
                        pr_err("%pOFn or parent must have reg[%d]!\n",
                               node, index);
                        return -EINVAL;
                }
        }


We have two usecases here (status quo in dts usage and code):
If these interface clocks are below a ti,clksel then we are describing 
multiple bits in the same register and therefore every child of ti,clksel
would have the same reg.
If the interface clock is not below a ti,clksel then we have reg.

Regards,
Andreas

