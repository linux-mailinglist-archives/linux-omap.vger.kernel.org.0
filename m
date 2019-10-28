Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9628EE73E7
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 15:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390273AbfJ1OnP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 10:43:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727982AbfJ1OnP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Oct 2019 10:43:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11CFA21721;
        Mon, 28 Oct 2019 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572273795;
        bh=BOflCilYti2drkMcOH9FYOtU0uFs1ARO5iv4EuX7X8U=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=aWUWE+ZkmBGGqlagft8TjjyV1Ue2OaQYoQFsMPRtsmQA3qh7KxBv59imY/yXHuOKS
         qp3RptX/qo4IAJ6eqzLV9oijkmQ0qdl9wI79gbueXEGTi3rUvb6xmZwKGPV2c31v3k
         Zqolx7JJAo9Ou48tQ6tLNkJ8OMWEW7tCQdqvmW04=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a88261a3-4012-1497-dd82-e41c0f328afd@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com> <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com> <20191010143521.GX5610@atomide.com> <e37f9a2f-c554-300f-0866-8c8651941585@ti.com> <a88261a3-4012-1497-dd82-e41c0f328afd@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, s-anna@ti.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 07:43:14 -0700
Message-Id: <20191028144315.11CFA21721@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-10-24 05:28:23)
> On 10/10/2019 18:32, Tero Kristo wrote:
> > On 10/10/2019 17:35, Tony Lindgren wrote:
> >> * Tero Kristo <t-kristo@ti.com> [191010 08:34]:
> >>> Stephen, any comments on this one or shall I just craft a=20
> >>> pull-request for
> >>> this and rest of the TI clock driver changes towards 5.5? There seems=
=20
> >>> to be
> >>> a pile of them coming this time over...
> >>
> >> Sounds like we need an immutable branch for the clkctrl related
> >> changes against v5.4-rc1 that I can also merge into omap-for-v5.5/prm
> >> branch in addition to the immutable prm reset driver branch.
> >>
> >> Otherwise I can't apply any of the consumer device related dts
> >> changes into that branch AFAIK.
> >=20
> > Well, the sgx patch you can probably merge, as it will fail silently an=
d=20
> > only cause issues if you actually try to enable the device.
> >=20
> > However, yes I agree, we should probably setup an immutable branch here.
>=20
> Queued this series towards 5.5, thanks.
>=20

One minor comment. Otherwise looks fine. Thanks.

