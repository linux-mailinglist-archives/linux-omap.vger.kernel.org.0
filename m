Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A05CCFC2B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfJHORE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:17:04 -0400
Received: from muru.com ([72.249.23.125]:35954 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725795AbfJHORD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:17:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2FF498081;
        Tue,  8 Oct 2019 14:17:36 +0000 (UTC)
Date:   Tue, 8 Oct 2019 07:16:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Graeme Smecher <gsmecher@threespeedlogic.com>
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect'
 usage
Message-ID: <20191008141659.GC5610@atomide.com>
References: <20191004014548.29583-1-andrew.smirnov@gmail.com>
 <c40b8414-45a8-575a-c3c8-902ed35e5764@threespeedlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c40b8414-45a8-575a-c3c8-902ed35e5764@threespeedlogic.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Graeme Smecher <gsmecher@threespeedlogic.com> [191004 23:53]:
> Hi Andrey,
> 
> On 2019-10-03 6:45 p.m., Andrey Smirnov wrote:
> > According to
> > Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt,
> > i2c-mux-idle-disconnect is a property of a parent node since it
> > pertains to the mux/switch as a whole, so move it there and drop all
> > of the concurrences in child nodes.
> > 
> > Fixes: d031773169df ("ARM: dts: Adds device tree file for McGill's IceBoard, based on TI AM3874")
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > Cc: Benoît Cousson <bcousson@baylibre.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
> > Cc: linux-omap@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > 
> > This is purely a drive-by fix, since it concerns the HW I've never
> > heard of before. However I was working with PCA9548
> > (vf610-zii-scu4-aib is my HW) and looking at various users in the
> > kernel, when this code caught my eye. Apologies for the noise if this
> > fix is somehow bogus.
> > 
> > In case that it matters this patch is based on top of 5.4-rc1.
> 
> Thanks! We do have I2C address collisions on downstream bus segments, so
> keeping these segments isolated is important. I'm surprised this patch
> was necessary and happy to see it.
> 
> Lightly tested on 5.3.
> 
> Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>

Applying into fixes thanks.

Tony
