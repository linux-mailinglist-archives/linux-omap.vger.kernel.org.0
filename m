Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF3C1D3E05
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgENTzf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:55:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTzf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:55:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E5EB2065C;
        Thu, 14 May 2020 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486135;
        bh=oEFfTLaKi5y317LPZVrxdNTLX9imHQcn5EYxOACHEDA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kf4apm+Ij9Fk5cgJyv6tckcnXxdPhzOVhHHk0c60bXeAJQ0mdEjqFGD0R/dO5Ch2G
         V3bUZZpvUzaWlar//DCNGS1zdN/ynqyaGxnQAcEHBqERf5+YE51/3u56J3wBLWaBkg
         spWVEwFf9bYERzXs1ZnFvHg2wCzL3/nP3/oVXcqY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430083640.8621-2-t-kristo@ti.com>
References: <20200430083640.8621-1-t-kristo@ti.com> <20200430083640.8621-2-t-kristo@ti.com>
Subject: Re: [PATCH 1/3] clk: ti: dra7xx: fix gpu clkctrl parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:55:34 -0700
Message-ID: <158948613442.215346.17567162315196405245@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-30 01:36:38)
> gpu_cm:* parent clock name is wrong, replace this with correct
> gpu-clkctrl:* clock. Otherwise the clock ends up in the orphaned list.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
