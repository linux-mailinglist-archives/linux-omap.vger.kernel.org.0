Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE0BE092C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbfJVQh6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:37:58 -0400
Received: from muru.com ([72.249.23.125]:39132 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731727AbfJVQh5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:37:57 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 15BC280FA;
        Tue, 22 Oct 2019 16:38:31 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:37:54 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 0/3] ARM: dts: dra7: add vpe nodes
Message-ID: <20191022163754.GC5610@atomide.com>
References: <20191009175628.20570-1-bparrot@ti.com>
 <20191022162720.yile7i4qwxgbuuou@ti.com>
 <20191022163048.GY5610@atomide.com>
 <20191022163319.ceb5wkwabw3w3kou@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022163319.ceb5wkwabw3w3kou@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191022 16:34]:
> Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 09:30:48 -0700]:
> > * Benoit Parrot <bparrot@ti.com> [191022 16:28]:
> > > Tony,
> > > 
> > > Ping,
> > > 
> > > I already had comments from Rob but i would like your feedback before
> > > sending a v2.
> > 
> > Looks good to me in general other than what Rob commented
> > on. Did not spot any node naming issues here :)
> 
> Would I need to split off the clk*.c/.h as well here though?

Yeah please do patches with just drivers/clk/ti and
include/dt-bindings/clock changes in them. then Tero
can queue them into an immutable branch that I can merge
in too and use as a base for the dts changes.

Regards,

Tony
