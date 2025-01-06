Return-Path: <linux-omap+bounces-3007-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FBA0336B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25AC1885789
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A9B1E2849;
	Mon,  6 Jan 2025 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQO0HjvW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D701372;
	Mon,  6 Jan 2025 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207156; cv=none; b=oW237bTrLOOEt+PbxrrHQH69fH8RDgoKTVhZJf026lq+T80cGZA9urAhW8QA3DhFzdEGmh/xmJmngtB4mxknjWLJSawa/nFy7bDUMswVkvPwq4Q9gtVZ7919GUEwnFfrA5KkQsmDPDaxX4s8t0ce4xlgyRngSE9aauz8m8J9rpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207156; c=relaxed/simple;
	bh=1bAd2cg37bNOFIyYWD5gM17W2m0QLH7yiAYYwOUMmso=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=t3jtuuprhKzuJ1YseRYwAd0F6LbaRRq63kC+o32vCvNap22WdTBun0PmpXdT67zxyNf10CFOMQvnSAO4eppH1cHsXCXEWeOUx9kAE+EiLMf5LXJnCpAo0ypYmSrVM0Dg1TPFaLePrj/6IUq3z5gf2tKFfp/vvpXI6GXcEYny0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQO0HjvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA7C4CEE1;
	Mon,  6 Jan 2025 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207155;
	bh=1bAd2cg37bNOFIyYWD5gM17W2m0QLH7yiAYYwOUMmso=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=vQO0HjvW1tQuo3iHO4809aVyTFVkPeTuQF/ErUHEbiXLEEr42gZVaq2//wUy6Q+Aq
	 mYwpYar1iO/LP/xhVWD9zXNLX+msLh2Nrb3GMx6CH1GJmOnPxCg7NtfHU0dm7VLI/c
	 f9PXBHM05DYXhvN6jXmeN1wNTHlzNbMF2E4F2BqvxYsLHUOzLZa23E7BMnMiqtOeyf
	 XolvOg1HzDOXXVcj8F3QFto9WM1fJwQb5Qvv0e0ty4dxFcL/pOWHFVqclClIcygWM5
	 70urmB3UUn5wFtQkJJWefFXg+Qwa3EWIvgjGCYMIpcQxhihi4easlJI4/nvsjog652
	 XQPSnq58IJM0w==
Message-ID: <582660ce914f6585a9e17c10dda9aa85.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250105170854.408875-2-andreas@kemnade.info>
References: <20250105170854.408875-1-andreas@kemnade.info> <20250105170854.408875-2-andreas@kemnade.info>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ti: Convert gate.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Mon, 06 Jan 2025 15:45:53 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Andreas Kemnade (2025-01-05 09:08:53)
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> Clean up the examples during conversion to meet modern standards and
> remove examples with no additional value.
> Due to usage in code and existing devicetree binding, add the
> ti,set-rate-parent property.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Applied to clk-next

