Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1085D4DA493
	for <lists+linux-omap@lfdr.de>; Tue, 15 Mar 2022 22:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237513AbiCOV0v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Mar 2022 17:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbiCOV0v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Mar 2022 17:26:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB245BD1F;
        Tue, 15 Mar 2022 14:25:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C91A2B818C2;
        Tue, 15 Mar 2022 21:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F90C340E8;
        Tue, 15 Mar 2022 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647379535;
        bh=a1DRy59KBSvpfBS/knLhFJ3ZhRJa4GK/pC3wt82Aazg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mFVNMHAbPL6IOWUZTbNqcg30Izqmcnx2wnhHjAwEhbr3Uh1MfOA5Xgveq14jaLmMY
         +jx8sFq48rQJHZt3tRAUhgYmT5blF0kTKIw/K8RwIkGObtxi7STtKdp3MtspmGCcW0
         Fos83M9XFosBM23PHGN/AOewfSOBBfFlmsVgPHZZWfMJHXw5tWultRIoEscuIP37O7
         94MfPrKLYEWRuwDpHkS8VvwZVfqL1R58tEsRNhZGdMZFVFVnUOhhaFLgUHvT5QcKCp
         ekSfd+c2j/eyGDwv01RrZTz0Go1QVlDZ9lWxGjooXQN5tYbkqpRxYZEnnwbgJLjSly
         NdyLhc/4qI5Qg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YixV85yYNy+xxYEE@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com> <20220204084339.12341-2-tony@atomide.com> <20220311033439.15316C340EC@smtp.kernel.org> <YixV85yYNy+xxYEE@atomide.com>
Subject: Re: [PATCH 1/5] ARM: dts: Add clock-output-names for omap4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        linux-clk@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>
Date:   Tue, 15 Mar 2022 14:25:32 -0700
User-Agent: alot/0.10
Message-Id: <20220315212535.65F90C340E8@smtp.kernel.org>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-03-12 00:12:35)
> Hi,
>=20
> * Stephen Boyd <sboyd@kernel.org> [220311 03:33]:
> > Quoting Tony Lindgren (2022-02-04 00:43:35)
> > > To stop using the non-standard node name based clock naming, let's
> > > first add the clock-output-names property. This allows us to stop usi=
ng
> > > the internal legacy clock naming and unify the naming for the TI SoCs=
 in
> > > the following patches.
> > >=20
> > > Note that we must wait on fixing the node naming issues until after t=
he
> > > internal clock names have been updated to avoid adding name translati=
on
> > > unnecessarily.
> > >=20
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Tero Kristo <kristo@kernel.org>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> >=20
> > I assume I don't merge this through clk tree.
>=20
> AFAIK these won't conflict with other dts changes, so you could merge
> them if you like and they look OK. Or we can also wait for v5.18-rc1 and
> then I'll pick up the dts changes.

I'll let you take them through arm-soc.
