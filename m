Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753752465AB
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 13:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgHQLsd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 07:48:33 -0400
Received: from muru.com ([72.249.23.125]:40596 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgHQLsW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 07:48:22 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6068880A3;
        Mon, 17 Aug 2020 11:48:20 +0000 (UTC)
Date:   Mon, 17 Aug 2020 14:48:47 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
Message-ID: <20200817114847.GL2994@atomide.com>
References: <20191007220540.30690-1-aford173@gmail.com>
 <20191007220540.30690-2-aford173@gmail.com>
 <CAHCN7x+fnyXb+UO3xPd0nKeZNAPhRsXd5kTCAHxvg6hSt8Bx-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+fnyXb+UO3xPd0nKeZNAPhRsXd5kTCAHxvg6hSt8Bx-A@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200805 13:17]:
> I know this is an old thread.  I am trying to revisit some of the
> other issues that came about with this, but is there any way we can
> get patch 2/2 applied?  It might not do anything unless the bandgap
> sensor is enabled, but it at least gets us one step closer for those
> who choose to enable it.  With 1GHz support now available, it would be
> nice to have the precautions to protect the processor from running too
> fast when its too hot.

Sure seems OK to me. Care to resend as I no longer have it in my inbox?

Regards,

Tony
