Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16A8A229E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2019 19:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfH2RnK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Aug 2019 13:43:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726661AbfH2RnK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Aug 2019 13:43:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E96D20674;
        Thu, 29 Aug 2019 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567100589;
        bh=mjslpPHGtEDwGZueAQ46/cgrEEfGqC5lXFcjVTs2u4Y=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=bl8v2sL91TDdw9ack7i0skLxScM6e9vX/Wodtl53zCkTGuirL0MWnwol0siTItoQi
         gsd8nXJwjifQHhDvrNmQ+UOdtep3BQd8CcdgvRB0hnb50kp4YUW3M9natO96Cvp7qj
         LDpPNm/4RJ7NzBt8m2qCqjlCaGStUab0EmL8b6Kc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190828065929.32150-1-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com
Subject: Re: [PATCHv2 0/6] clk: ti: reset handling support fixes
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 10:43:08 -0700
Message-Id: <20190829174309.5E96D20674@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-08-27 23:59:23)
> Hi,
>=20
> This is v2 of the earlier series [1]=C2=A0targeting remoteproc / reset su=
pport for
> OMAP SoCs. None of the earlier patches have been retained, mostly everyth=
ing
> is re-written. :)
>=20
> Couple of notes about the individual patches:
>=20
> #1: needed so that reset handling code can find clkctrl handles
> #2: just to convert the code to look a bit neater with all the bit
>     handling logic
> #3: new TI SoC only API for checking standby state for clocks, needed
>     for remoteproc idle status handling
> #4: new TI SoC only API for syncing up status between reset + associated
>     clock
> #5/#6: add missing IVA clkctrl clock entries for omap5, this has been
>     just missed before and is needed as IVA has reset lines
>=20
> I know its already quite late for 5.4, but in theory these
> could be picked up for it also. If not, pushing for 5.5 is fine.

Its sort of late. I guess let me throw it into fixes and try to send off
one more PR to Linus early next week.

