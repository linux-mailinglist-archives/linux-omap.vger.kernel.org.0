Return-Path: <linux-omap+bounces-701-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCB85F0C1
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 06:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8960283F99
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 05:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147737482;
	Thu, 22 Feb 2024 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSqY0f2/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27797462;
	Thu, 22 Feb 2024 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708578716; cv=none; b=luwUGLkv4hFbO3Mpvgw1yqY9SDL0lfgzQfBtr2eqg8p9ZxewhldQ2BtdtCTsRiGaLDKx+KWy16Bk240bI/81bEbAUlefhF+iozQ5qscwmuIvvxkJw2VmAQpJsvzPDBfaGePBt3TkgZwjcEoqlAOhcW3qQAz72vO8/f/ure5OBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708578716; c=relaxed/simple;
	bh=3GN/Xp+CwCVPckrw6i6HLhIzhwF2l3BRHJ0yeWWZE2Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LgdhTekenmgBjdv4i2Dljaai0MouxwnFCfjblAVsKFWAkXiwNo8V+K71Tecr7UhLoDp7wozmaWhIH459FbVpi1daFwocbXJ+QHsig79SH5H7/sgYMDbf4D9UKmMKZ25RfdOwNzrbd1dpPe+1CDJvQV0d6IjNK0GfnjQffZLUKxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSqY0f2/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC0C433F1;
	Thu, 22 Feb 2024 05:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708578716;
	bh=3GN/Xp+CwCVPckrw6i6HLhIzhwF2l3BRHJ0yeWWZE2Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LSqY0f2/GgR8ra4tTWTD+DYASpQf19MMZoIsAHAm3TBTnzAfpi5wJ+NuMPb0F7vqD
	 QBSyNjKaiSa2pI7VqOmvtcbfEzghicxun/Hml6X6sBomOX9BFM23MFqgYd8EH7Pne0
	 aNf75sv3ZflB2dfuxnSu/m4szmtpKI75cFvdlv6fIGekZ6VE68FXPbgb/gNbsxYfsn
	 S3VFuyGbd4hfd3SOC/d8g70Z1mGGht6ItMlHrYSOgCH5647OcI3+5woF6RK0qA3ze0
	 jqvWE2bdI9uzgXE+OtT/QAfeAm/gvz6NmdR7mEHpdG3M5kw0uZh40QapM/0LJzNF2p
	 EUF6fs1nb1xPQ==
Message-ID: <1c1cf894cab0b81ed2af953ec30890ed.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240213105730.5287-2-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com> <20240213105730.5287-2-tony@atomide.com>
Subject: Re: [PATCH 1/4] clk: ti: Handle possible address in the node name
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>
Date: Wed, 21 Feb 2024 21:11:54 -0800
User-Agent: alot/0.10

Quoting Tony Lindgren (2024-02-13 02:56:41)
> In order to use #address-cells =3D <1> and start making use of the
> standard reg property, let's prepare things to ignore the possible
> address in the clock node name.
>=20
> Unless the clock-output-names property is used, the legacy clocks still
> fall back to matching the clock data based on the node name.
>=20
> We use cleanup.h to simplify the return path for freeing tmp.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

