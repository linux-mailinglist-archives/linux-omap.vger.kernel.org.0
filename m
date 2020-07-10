Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A357221BF88
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 00:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGJWID (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 18:08:03 -0400
Received: from muru.com ([72.249.23.125]:33360 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbgGJWID (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Jul 2020 18:08:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C6A0180E5;
        Fri, 10 Jul 2020 22:08:56 +0000 (UTC)
Date:   Fri, 10 Jul 2020 15:08:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Message-ID: <20200710220800.GI5849@atomide.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
 <4602b219-6822-4ebc-66c6-c64740793938@ti.com>
 <20200710175907.GH5849@atomide.com>
 <bc05fbe7-be02-e44e-3461-69f7c06b7d34@ti.com>
 <557ebada-4a2f-32ed-fbea-2daba8daa073@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <557ebada-4a2f-32ed-fbea-2daba8daa073@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200710 20:46]:
> On 7/10/20 1:29 PM, Suman Anna wrote:
> > On 7/10/20 12:59 PM, Tony Lindgren wrote:
> > > +#define OMAP4460_VDD_MPU_OPPNITROSB_UV        1390000
> 
> I am not sure about this, I see it as 1380 for both OPPNITRO and OPPNITROSB.

OK I'll drop that one.

> > > +#define OMAP4460_VDD_IVA_OPP100_UV        1140000
> 
> Btw, this should be 1114000

OK thanks for catching it.

> > > +#define OMAP4460_VDD_IVA_OPPTURBO_UV        1291000
> > >   #define OMAP4460_VDD_IVA_OPPNITRO_UV        1375000
> > >   struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
> > > @@ -91,8 +93,8 @@ struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
> > >       VOLT_DATA_DEFINE(0, 0, 0, 0),
> > >   };
> > > -#define OMAP4460_VDD_CORE_OPP50_UV        1025000
> > > -#define OMAP4460_VDD_CORE_OPP100_UV        1200000
> > > +#define OMAP4460_VDD_CORE_OPP50_UV         962000
> > > +#define OMAP4460_VDD_CORE_OPP100_UV        1127000
> > >   #define OMAP4460_VDD_CORE_OPP100_OV_UV        1250000
> > >   struct omap_volt_data omap446x_vdd_core_volt_data[] = {
> > > 
> > 
> 
> Atleast this update and the previous OMAP4430 patch matches up to what I can
> see from the Data Manual. So, guess you can add an official version of this
> patch.

OK thanks for checking. I'll post an updated patch with a proper
description.

Regards,

Tony
