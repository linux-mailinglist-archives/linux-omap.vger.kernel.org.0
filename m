Return-Path: <linux-omap+bounces-2996-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E1A031F0
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 874C818849C7
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 21:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5EF1DF738;
	Mon,  6 Jan 2025 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQQb4oC/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9021E048B;
	Mon,  6 Jan 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198226; cv=none; b=FGYSW6T0Amihw2BvMMPnPRzbdZ6yQjUuGLAOSM2kW2B1zG6r7w7KebPvreBOgitOb2USwZglRFLWPaAWmyGa2QT4p651yNR5WIXigRBMBMNXw1Elcz4jj72kyhbisvjUXyiNDb0Z3X37ROO3OGrhvSgkJg1oE8ZLSWbr7Q/XnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198226; c=relaxed/simple;
	bh=TS8uKhqtSpQt21DTQ274Jqexn9C+zEdpEx6yQlWw9as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKJX3jW0+TV8O0pAUZDNiwDVq1hjcV3IQrOPiinXK+EKD35TFcS9FS8sTYXe2XOOwl62ZB4DGb9ryTXmgQE6MADIF/Jc814tniKxLeob5D/WhZ97oP7Q9LKq2+nI9J2Y6otN6GCxfOzks5lv70sZAi5nSvqvUS4XCUA0X4V/mss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQQb4oC/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6F4C4CED2;
	Mon,  6 Jan 2025 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736198225;
	bh=TS8uKhqtSpQt21DTQ274Jqexn9C+zEdpEx6yQlWw9as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQQb4oC/z0V4JfGEs+YY2XUQLiAvcFOm+nmjAp9BtwWyWtyuJOty7AXKMt6H7FYTX
	 IgY+IcTbsvNMp4zuKpNBKd4pB9CGoCCA4YAR3WfcwYo7jZl9wPz1B8IAlNRgP710Cs
	 JrA+j/XEWHFZRRX1vjr4PEjtFuVmSqVoJfnV6dSIR5bCoxcTE4m1j9GwCWC5Rh8Ou9
	 ntGousK/PBmBFuufJvy6hc+Y00G/ZxzYksHDdSqPStZf0KlqoxbCNXR/jiz4Fp+d4D
	 c9vAKfQs4JwUUghKefb8BgBvyul4/5tE6gmtO83cLUTLJMUQj2WH3vr5qu//Z8tyUN
	 oZscdMhRmGRag==
Date: Mon, 6 Jan 2025 15:17:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ti: Convert gate.txt to
 json-schema
Message-ID: <173619822400.1023574.1184381985229490776.robh@kernel.org>
References: <20250105170854.408875-1-andreas@kemnade.info>
 <20250105170854.408875-2-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105170854.408875-2-andreas@kemnade.info>


On Sun, 05 Jan 2025 18:08:53 +0100, Andreas Kemnade wrote:
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> Clean up the examples during conversion to meet modern standards and
> remove examples with no additional value.
> Due to usage in code and existing devicetree binding, add the
> ti,set-rate-parent property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/clock/ti/gate.txt     | 105 ---------------
>  .../bindings/clock/ti/ti,gate-clock.yaml      | 125 ++++++++++++++++++
>  2 files changed, 125 insertions(+), 105 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


