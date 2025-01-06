Return-Path: <linux-omap+bounces-2997-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD80A031F4
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F62B16165B
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 21:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5448F1E0B7F;
	Mon,  6 Jan 2025 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XafOvofD"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F7EEB3;
	Mon,  6 Jan 2025 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198238; cv=none; b=ZM+dRA2JDhJkOsttoCR4c4qFOW0Q1U9wXTNvFXDaFRdFLEwSXB3N8for00xQ3a8+loZnKxAkmDXpETT1v2ILTBPpWTeAbEiEQXjWCpBLOxf/XxIaPKkMJS/cMRDJHCmxI9/wvLbjuz5O5CI1iZwG/8VtARTCv4s/HnSe5ScoENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198238; c=relaxed/simple;
	bh=AvuoJl6Pcuz67z2j20A+BOC6wlJWFLfnQZdcgAbwp74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwmIeEG8xCYXHsxL9uOepo1ZYpZmDvNbnIJnZ5GYKQEx+H0j6pU5rAzyzN9s8RwuVjpSDx6t5orB9LkLY/SttNJkz9kClp2tjvFobM7a83O0R6YvszB2heBk/YUby5GUeHj7+jRqE2nUUYIkSPepEeSSdjxgANmLsYmbyJJTXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XafOvofD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D018C4CED2;
	Mon,  6 Jan 2025 21:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736198237;
	bh=AvuoJl6Pcuz67z2j20A+BOC6wlJWFLfnQZdcgAbwp74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XafOvofDqX41PyOtvTD1lc1nYHuMIdW7ty4q4uRlMEA5125ruOTF6u0qtDFMo+u2A
	 SK6BdjNHXu2j9RRlwcPMUYt9hF7C/2VPdmQyRKCohy2bs21AUszMQn6FAp6A0JziFF
	 QBadmgTIGjCEWPUGaPebddXHSlche3lm4YyNQNOKaEcZoU/6zX/X7TnxDz8AtgmUix
	 BsnwcZZAcABLn4uwB+4t5kNB1Tkjjtu/sau9EI8/LwZ6TbiczZK/H26tnqPLxqvJwR
	 UeVPlbpHw1TCB+h2HrJ0gYyL9nF7A8hP1LAB8M+CFgWm23flODixGOS0t5BVEvXNX9
	 KmkzMxRV3X4fg==
Date: Mon, 6 Jan 2025 15:17:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: ti: Convert composite.txt to
 json-schema
Message-ID: <173619823550.1023974.12706750930453116268.robh@kernel.org>
References: <20250105170854.408875-1-andreas@kemnade.info>
 <20250105170854.408875-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105170854.408875-3-andreas@kemnade.info>


On Sun, 05 Jan 2025 18:08:54 +0100, Andreas Kemnade wrote:
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/composite.txt           | 55 -------------
>  .../bindings/clock/ti/ti,composite-clock.yaml | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


