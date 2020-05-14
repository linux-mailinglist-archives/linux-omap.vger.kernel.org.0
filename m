Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916161D3E09
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgENTzn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTzn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:55:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 026E52065C;
        Thu, 14 May 2020 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486143;
        bh=Aa/3H47uFWC2/0q0abwJhHfDwXbrQG02nMr4p4Vd1qc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1FdmqHByV4+NQdNj3W8osU7HTeP3i8F/FwEfnqpo/3/cf/9KQ0kK1aCUrkLiWx5Km
         Xsy3MKNjtLoSCiXuA4rSTewATmvYkaJeoHMzA09v5/AOqfOCcjTrycfCMdsm6sWXJ8
         zN0IqZtZNZ9QUCyHfNhDhhThGGFpgPNOjQ+p4qbU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430083640.8621-4-t-kristo@ti.com>
References: <20200430083640.8621-1-t-kristo@ti.com> <20200430083640.8621-4-t-kristo@ti.com>
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: fix RNG clock parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:55:42 -0700
Message-ID: <158948614233.215346.7786503812699873424@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-30 01:36:40)
> RNG is sourced from L4 clock. Add info for this for proper parenting of
> the clock.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
