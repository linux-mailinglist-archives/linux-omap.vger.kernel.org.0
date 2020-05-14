Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2E21D3E01
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgENTzA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:55:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTzA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:55:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E28462065D;
        Thu, 14 May 2020 19:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486099;
        bh=IJmvPkugFmoWto/k1qe3bWNeG9e4dHqyaSfw7Gb0UKE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eNtm8xF7KAMNC7qghabhEywdO2XP+Z9b7o+kiz28MlPmiwqsdPGGm9ASS0MTpSL4F
         5tarFpc5D6MsYjp5zLfMnL3Pl7mAFCQFpsu0u5WC40QuzGagVmGwo4TshuL7Ck3gKu
         fAGwC55/F/+mYnDn/iuAHq3cjnU07bjYtdDv/6L0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200429131341.4697-3-t-kristo@ti.com>
References: <20200429131341.4697-1-t-kristo@ti.com> <20200429131341.4697-3-t-kristo@ti.com>
Subject: Re: [PATCH 2/3] clk: ti: omap4: Add proper parent clocks for l4-secure clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:54:58 -0700
Message-ID: <158948609824.215346.546682161342838501@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-29 06:13:40)
> L4 secure clocks do not have their parents set currently, which ends
> them up to the orphan clock list. Fix this by adding either l3 or l4
> clock as their parent.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
