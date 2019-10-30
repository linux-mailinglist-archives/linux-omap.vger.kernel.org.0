Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAFA0EA18A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 17:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJ3QQJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 12:16:09 -0400
Received: from muru.com ([72.249.23.125]:40252 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfJ3QQJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Oct 2019 12:16:09 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3A61C8027;
        Wed, 30 Oct 2019 16:16:43 +0000 (UTC)
Date:   Wed, 30 Oct 2019 09:16:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191030161604.GA5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191018 18:47]:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
> @@ -0,0 +1,76 @@
> +Imagination PVR/SGX GPU
> +
> +Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by this binding.
> +
> +Required properties:
> +- compatible:	Should be one of
> +		"img,sgx530-121", "img,sgx530", "ti,omap-omap3-sgx530-121";
> +		  - BeagleBoard ABC, OpenPandora 600MHz
> +		"img,sgx530-125", "img,sgx530", "ti,omap-omap3-sgx530-125";
> +		  - BeagleBoard XM, GTA04, OpenPandora 1GHz
> +		"img,sgx530-125", "img,sgx530", "ti,omap-am3517-sgx530-125";
> +		"img,sgx530-125", "img,sgx530", "ti,omap-am335x-sgx530-125";
> +		  - BeagleBone Black
> +		"img,sgx540-120", "img,sgx540", "ti,omap-omap4-sgx540-120";
> +		  - Pandaboard (ES)
> +		"img,sgx544-112", "img,sgx544", "ti,omap-omap4-sgx544-112";
> +		"img,sgx544-116", "img,sgx544", "ti,omap-omap5-sgx544-116";
> +		  - OMAP5 UEVM, Pyra Handheld
> +		"img,sgx544-116", "img,sgx544", "ti,omap-dra7-sgx544-116";

FYI, the compatible names above have unnecessary omap in them:

"ti,omap-omap3-sgx530-121" should be "ti,omap3-sgx530-121"
"ti,omap-am335x-sgx530-125" should be "ti,am335x-sgx530-125";
"ti,omap-dra7-sgx544-116" should be "ti,dra7-sgx544-116"

And so on.

Regards,

Tony
