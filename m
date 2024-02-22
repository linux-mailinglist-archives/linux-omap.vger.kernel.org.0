Return-Path: <linux-omap+bounces-700-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 207F585F0BF
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 06:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56561F21E48
	for <lists+linux-omap@lfdr.de>; Thu, 22 Feb 2024 05:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE1F6FD0;
	Thu, 22 Feb 2024 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5ul3eKJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00063CB;
	Thu, 22 Feb 2024 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708578707; cv=none; b=OJO+Xp6XYBm5SQtS0qkgnYzUhs3kveyDEVIHxxHRCL5m2yUESnarCsDVDfwBtv7ZBbtiU9D7wkEeoymUNzt4Xqk5RO1crdqGVzTsV33OhDd99y8AtNMJq4y7KFkJmSa1MUxgXGaGfa9lOzvbJfRN1r68an17zkm4vpu1JSzT+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708578707; c=relaxed/simple;
	bh=fpLNGYOZrE4/3lL3Ro12jT4iLH4v+6xQEpRBnAvLLHA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=OzP3CcxI4KAKUyC+7eH1lk+FT1fjxQKzhrZKKMwrJW4lMkAIx5rAgEpZEOs5fxoXZmhL3wmNus42jjjIzBRxK9lPO+GsJ55bVmdAYX5mYCRLwuc0CXr5iX65eqoWRVR2Q9j6Qc/ps8SW+KberQy1/F0cpruZYRbQ750w2YMPPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5ul3eKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F7FC433C7;
	Thu, 22 Feb 2024 05:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708578707;
	bh=fpLNGYOZrE4/3lL3Ro12jT4iLH4v+6xQEpRBnAvLLHA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u5ul3eKJdRErR6fLbvjkMrgnogbsN9QnsoLYUZbz7VyskK15UdETYoCpqH0taufY+
	 l7H3tMSZXAgzGMclYy2GW7td/+j6AWR2Ae9EUbvmMVJnkgdaZeJafFy8pKkCC3DWT3
	 hmsGcYVnV6WGe2DCD5nSTUGeJTYbcsc5IXJZR1bLBQzSymkr5m3NlhJXcq4EoJznh9
	 I7ePSxuyQw+KFZFQlEEasX02/JEVshMGvk1+RFBKjX0+nEK3+pRpzvRfqe5WVSR+j1
	 jjygoZI2xcnKFf+67FCgu+GDNad+U9RCKw+YnvMm6nBlg05WiDIuAKeqQN2vRlUnls
	 fzMNH15vS3vYQ==
Message-ID: <144cd6f62dcde98b94e3d7f4075e1128.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240213105730.5287-3-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com> <20240213105730.5287-3-tony@atomide.com>
Subject: Re: [PATCH 2/4] clk: ti: Improve clksel clock bit parsing for reg property
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>
Date: Wed, 21 Feb 2024 21:11:44 -0800
User-Agent: alot/0.10

Quoting Tony Lindgren (2024-02-13 02:56:42)
> Because of legacy reasons, the TI clksel composite clocks can have
> overlapping reg properties, and use a custom ti,bit-shift property.
>=20
> For the clksel clocks we can start using of the standard reg property
> instead of the custom ti,bit-shift property.
>=20
> To do this, let's add a ti_clk_get_legacy_bit_shift() helper, and make
> ti_clk_get_reg_addr() populate the clock bit offset.
>=20
> This makes it possible to update the devicetree files to use the reg
> property one clock at a time.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

