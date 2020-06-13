Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF7E1F8406
	for <lists+linux-omap@lfdr.de>; Sat, 13 Jun 2020 17:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgFMPuu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Jun 2020 11:50:50 -0400
Received: from muru.com ([72.249.23.125]:57834 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgFMPut (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 13 Jun 2020 11:50:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A66CB80FA;
        Sat, 13 Jun 2020 15:51:40 +0000 (UTC)
Date:   Sat, 13 Jun 2020 08:50:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
Message-ID: <20200613155046.GV37466@atomide.com>
References: <20200504230100.181926-1-aford173@gmail.com>
 <20200505184223.GR37466@atomide.com>
 <CAHCN7xJxg+uO4h2RcapyjormTMzXFwoMUOi7rh2hUsScJtK56Q@mail.gmail.com>
 <20200505233408.GS37466@atomide.com>
 <CAHCN7xJnBkihY0XwNw+7xj5qZhwz_Up-b_LEt3PY8aFWVYsnrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJnBkihY0XwNw+7xj5qZhwz_Up-b_LEt3PY8aFWVYsnrQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200613 11:11]:
> Through trial and error, I think I have the right IRQ for OMAP3630 for
> the 2nd instance.

OK great.

> > > I assume the second engine uses different interrupts.  I don't suppose
> > > anyone know what it should be?
> >
> > Sorry no idea, usually the secure accelerator documentation is just
> > left out it seems. My guess the values are the same as on omap3.
> 
> Tony - Could you review the hwmod transition I did for the first
> engine to make sure I did it right?

Yeah that's about all there is to it :)

> If you think I did it right, I'll post my V2.

Yes please do.

Regards,

Tony
