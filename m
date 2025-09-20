Return-Path: <linux-omap+bounces-4643-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B684B8BFC5
	for <lists+linux-omap@lfdr.de>; Sat, 20 Sep 2025 07:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6962F1C0646F
	for <lists+linux-omap@lfdr.de>; Sat, 20 Sep 2025 05:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494CC22D793;
	Sat, 20 Sep 2025 05:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhHj3pNe"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCD1E8324;
	Sat, 20 Sep 2025 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758346079; cv=none; b=o3kIgPtGZNHtq2a8NaFnJowDq/fgnGXQgdgsqUkUV57RLoAPJBYgtyY+CE/tWNWxL4zWeGjrOyeQNjaewWsQmX/16x22N4G8gTRjldChK5t2Sh45cbkdp7jNBgt2hsL+3UxXMERJi9YQBNnkmu3J2Eurjuep0m1g/qAraCMwPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758346079; c=relaxed/simple;
	bh=j2yDnaWcyeuNByCwwYbD0QhRUX1WP9HxwDhv2rhvRps=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=V0dnyiI7bSQp4/o3PO7LiSq8UOjeNpJL1wuwo+lfC0L+n21k/pTim7+ebjkxU0MqTe79ppO0hfMvn0+pgxy95/rkDS2wnsimA0XdCt/zFsj2pJSTGWkWVXOuZSkofKXmgNOEz1i797JvZdgX72NpaI8giW3pP2/1lWzaRkCY8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhHj3pNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59724C4CEEB;
	Sat, 20 Sep 2025 05:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758346079;
	bh=j2yDnaWcyeuNByCwwYbD0QhRUX1WP9HxwDhv2rhvRps=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lhHj3pNekMGbGE6+WfLGAc07whvDGs9ITlZyvlUf+zn7uX/sLW8B3HwHhYSgQit4G
	 6pFCi1xtNF+iV1iFsxBvMP4KRqFg54fEIgc8U1huvwSMktK6Qxx8oVzQbOTQR5H6Zm
	 OMI22YgityYvdVB8Z+qfGVTspik/ESb+a57L6kUWSyzzebYovK4Ht8CZGn6S2fEnko
	 14dZ0aH5u8rcH0BHNwkKfpc7utQhk1nzRwWWXhNpjdniVRaX6Q7tM5YKzbo87CUtH0
	 ExJeUmu9sNnCbJPVeztEcsAw/97ZZwJUn5BiQaopw57Ezwj0Kw+FNcUCXmL4Fnfaz7
	 KcpXNO88H4BZQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
References: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Michael Turquette <mturquette@baylibre.com>, Tero Kristo <kristo@kernel.org>
Date: Fri, 19 Sep 2025 22:27:58 -0700
Message-ID: <175834607850.4354.8043302414076275007@lazor>
User-Agent: alot/0.11

Quoting Alexander Stein (2025-08-25 07:08:11)
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>=20
> As described in AM335x Errata Advisory 1.0.42, WKUP_DEBUGSS_CLKCTRL
> can't be disabled - the clock module will just be stuck in transitioning
> state forever, resulting in the following warning message after the wait
> loop times out:
>=20
>     l3-aon-clkctrl:0000:0: failed to disable
>=20
> Just add the clock to enable_init_clks, so no attempt is made to disable
> it.
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied to clk-next

