Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CB41D3E07
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgENTzi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:55:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTzi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:55:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F6902065C;
        Thu, 14 May 2020 19:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486138;
        bh=p11FaD2hiCHv+xVf6GF/ypayIUxIHyb0tXY9FL+zYnY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OTlUKQagEJuh7E+YOceYvh/7+tWDoh07VRg7d4PAOjqZG/UtfMnV8tVAtBKp5cXOR
         BCuhkbJ0kEnG9ZmdA0IpV1heFjrupttheR5sO4ttA4pP1HsrIVOQPqxnTVIbxsh4db
         OGzN7YSFRZCmG9dKRBiINg6arQhGOlF6x4skt0BA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430083640.8621-3-t-kristo@ti.com>
References: <20200430083640.8621-1-t-kristo@ti.com> <20200430083640.8621-3-t-kristo@ti.com>
Subject: Re: [PATCH 2/3] clk: ti: dra7xx: mark MCAN clock as DRA76x only
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:55:37 -0700
Message-ID: <158948613756.215346.5268349281051234838@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-30 01:36:39)
> This clock entry does not exist on any other devices except DRA76,
> so mark it as specific to that SoC only.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
