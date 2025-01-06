Return-Path: <linux-omap+bounces-3010-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE75A03374
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF92D16424C
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB131E3DC3;
	Mon,  6 Jan 2025 23:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onIjeP/B"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF81E231E;
	Mon,  6 Jan 2025 23:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207170; cv=none; b=CgkZhduHtQJPkq/saGwaOx+zIqvbibRakC8M4PXZ7VmB6rmzwrDoMaJDbVXqQ64uMh9R1YoXdz2qSPEdcTUEGh4KyzS06wZKnPg5mlFnaKjPy5tA4zH3pM9AsESGW33L7MMU5/vGuJbIiea2ZD0Y5fXr8CBSlRkDs7xwNAkekPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207170; c=relaxed/simple;
	bh=XMPH7zELyFXyAhumv6d6RvmBiWQ8qNxaNzqtGHAS3sk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=BriiaOyjbt725Rv9TemoY/ifkywh5SP8+buNxAHFocLIQiQOt6fav2qxNFbSegK2FIl2ilyK7mvKQYkF1s3vSubSUfceajHW+1udkMwgToh6qwoqEXDbD06wUlOSQoqhe62TfxFA/YUdA9IIJFY+ViOoK7McR1/hvzxaEZ8N9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onIjeP/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672A6C4CED2;
	Mon,  6 Jan 2025 23:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207168;
	bh=XMPH7zELyFXyAhumv6d6RvmBiWQ8qNxaNzqtGHAS3sk=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=onIjeP/B546SZS0/bGDmCH827xDNmtVVNDsl4mP6E0ePnlEa8JL+DCZZ3mt36CY4Y
	 LXcur1LQO5Y0KecY9ayfB9UaxLNhhcFFK57gVLzmUCFfjcXgZqMYXv8FgDa1RpDRwV
	 ONqByIEPChsTzNBUz0sY8xVe/HMcScxQ8NgCGtJg5WhTBLBLYp+abrtITn/vtCHJ3j
	 WYvyGQhSqa/TbxU6gqcRtvFXk0JTZUUEDAXyg4PwrbgTZXd+9yd/ildBcMBt+YsCXd
	 5PfXC40k3XNg3rDZwUVO036JuM5RRmmo5Z5X+Q0JbncgEP/AtxVT4WUpiIx8GsT+YU
	 2p7yNEiSh7DtA==
Message-ID: <35141e762058fab430d60b2f9f965c6a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250105170854.408875-3-andreas@kemnade.info>
References: <20250105170854.408875-1-andreas@kemnade.info> <20250105170854.408875-3-andreas@kemnade.info>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: ti: Convert composite.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Mon, 06 Jan 2025 15:46:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Andreas Kemnade (2025-01-05 09:08:54)
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Applied to clk-next

