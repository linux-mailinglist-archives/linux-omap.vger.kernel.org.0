Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549C0248088
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 10:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgHRI0V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 04:26:21 -0400
Received: from muru.com ([72.249.23.125]:40692 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgHRI0U (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Aug 2020 04:26:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 602A4810D;
        Tue, 18 Aug 2020 08:26:18 +0000 (UTC)
Date:   Tue, 18 Aug 2020 11:26:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     santosh.shilimkar@oracle.com
Cc:     linux-omap@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 0/6] Add initial genpd support for omap PRM driver
Message-ID: <20200818082645.GM2994@atomide.com>
References: <20200702154513.31859-1-tony@atomide.com>
 <20200817065300.GD2994@atomide.com>
 <f52bc6c2-1256-a3ca-fede-1d3ab441ef9f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52bc6c2-1256-a3ca-fede-1d3ab441ef9f@oracle.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* santosh.shilimkar@oracle.com <santosh.shilimkar@oracle.com> [200817 15:25]:
> On 8/16/20 11:53 PM, Tony Lindgren wrote:
> > Hi Santosh,
> > 
> > * Tony Lindgren <tony@atomide.com> [200702 18:46]:
> > > Hi all,
> > > 
> > > Here's v4 set of patches to add genpd support to the PRM (Power and Reset
> > > Module) driver.
> > > 
> > > Initially we just add one hardware accelerator power domain for sgx,
> > > and one interconnect instance for l4_abe. The rest of the SoC specific
> > > domain data is probably best added one SoC at a time based on generated
> > > data.
> > 
> > Care to ack some of these patches? I'd like to get this into Linux next
> > for v5.10 :)
> > 
> Sure,
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

Thanks, I've pushed out this series into omap-for-v5.10/prm-genpd and
for-next branches.

Regards,

Tony
