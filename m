Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691ADE0974
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732814AbfJVQoh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:44:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37004 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732813AbfJVQog (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:44:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGiUWH068093;
        Tue, 22 Oct 2019 11:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571762670;
        bh=3tSyKaR47UTPq3O6a4+xnOssU/JnJNuQidYM5eTyQ7c=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=zNUIAr8cti1QoserTPMs7QAiduyWwTUrXrHMuYtcXjBMqhCn1V92IvlgmOw9bdVxb
         w3R87u995g+RXidKNdJDFO+gHRbm2M4hY0omSpR7l6HZI/Axi529FOLJkYBVHCeHjC
         B6zUZRi4mathOPS8sB9kBB/EfFlkKVamAuntiHrg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGiUhe054361
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:44:30 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:44:30 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x9MGiULE067236;
        Tue, 22 Oct 2019 11:44:30 -0500
Date:   Tue, 22 Oct 2019 11:44:29 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 0/3] ARM: dts: dra7: add vpe nodes
Message-ID: <20191022164429.4hcyrnmtvklfd4oq@ti.com>
References: <20191009175628.20570-1-bparrot@ti.com>
 <20191022162720.yile7i4qwxgbuuou@ti.com>
 <20191022163048.GY5610@atomide.com>
 <20191022163319.ceb5wkwabw3w3kou@ti.com>
 <20191022163754.GC5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191022163754.GC5610@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 09:37:54 -0700]:
> * Benoit Parrot <bparrot@ti.com> [191022 16:34]:
> > Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 09:30:48 -0700]:
> > > * Benoit Parrot <bparrot@ti.com> [191022 16:28]:
> > > > Tony,
> > > > 
> > > > Ping,
> > > > 
> > > > I already had comments from Rob but i would like your feedback before
> > > > sending a v2.
> > > 
> > > Looks good to me in general other than what Rob commented
> > > on. Did not spot any node naming issues here :)
> > 
> > Would I need to split off the clk*.c/.h as well here though?
> 
> Yeah please do patches with just drivers/clk/ti and
> include/dt-bindings/clock changes in them. then Tero
> can queue them into an immutable branch that I can merge
> in too and use as a base for the dts changes.

Although the .h is in include/dt-binding. Does it still belong in the same
patch as drivers/clk/ti/clk-7xx.c then?

Just making sure....

> 
> Regards,
> 
> Tony
