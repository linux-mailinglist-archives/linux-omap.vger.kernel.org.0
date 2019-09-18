Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7039BB6FAD
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 01:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbfIRX2o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 19:28:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727000AbfIRX2o (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 19:28:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2CBB21907;
        Wed, 18 Sep 2019 23:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568849323;
        bh=9suyZaK6moT+pf4nxvHi0UVoD+agnWhMXbnINjirrAM=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=tHEDvao3m/Ha6GSWe8ThcwFTY5/1b7g83crpdWK7eVHyHo7/oTFLpEKFPbfl785Y5
         sOcN8JXkli0oGadY5tNEnyb7jjVCol7QG56g38bjC2qL8FwXxYksp6z71UfNoG5lUY
         YYyXF/ULLVAjVc0Jw8nhJBpyYlwSJHbXtRmcFkU8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190918205344.GE5610@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com> <20190907035518.EB40C208C3@mail.kernel.org> <20190908194241.GL52127@atomide.com> <20190918180729.C2BB521907@mail.kernel.org> <20190918205344.GE5610@atomide.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with reg-names
User-Agent: alot/0.8.1
Date:   Wed, 18 Sep 2019 16:28:42 -0700
Message-Id: <20190918232842.E2CBB21907@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-09-18 13:53:44)
> Hi,
>=20
> * Stephen Boyd <sboyd@kernel.org> [190918 18:08]:
> > Quoting Tony Lindgren (2019-09-08 12:42:41)
> > > Or do you have some better ideas on how to name a clock controller
> > > in the device tree?
> > >=20
> >=20
> > Why does the name of the clock controller or clkdm_name matter? Using a
> > string from reg-names smells like a workaround to describe some sort of
> > linkage between things that isn't being described in DT today.
>=20
> Correct. This problem will eventually disappear with genpd
> handling the clockdomains.
>=20
> But currently the clockdomain name is parsed from the dt node
> name, which is not standard practise. Using reg-names
> is a standard binding, and it's usage follows the standand
> here to describe the reg range.
>=20
> Then eventually with genpd, the reg-names will just become
> optinoal. But until that happens the $subject patch fixes
> issues as described in the patch.
>=20

Is anything broken? It looks like the hidden dependency on the node name
is being changed to be a slightly less hidden dependency on reg-names.
reg-names is supposed to be an optional property, so we're trading one
thing for another. I still don't understand the reasoning here, but if
Tero is happy to ack/review this change then I'm not too worried about
it assuming the reg-names property eventually becomes optional. Just
seems like more work and DT churn for no to little gain?

