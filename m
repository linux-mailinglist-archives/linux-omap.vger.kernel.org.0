Return-Path: <linux-omap+bounces-5555-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F9D39F7A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 08:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F026030186AA
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 07:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C164C2DB788;
	Mon, 19 Jan 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai8sspHB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641BD2BD0B;
	Mon, 19 Jan 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806949; cv=none; b=jn0S7jid9X61J9yAZZ2L42sLW99YmyeKs6ZeLN/Yw3Vz/TUSxdmbSGYZsHkxxlB636OZLzJvWGFNbt9pfPeUF0JBjcbnZ89HTxpRo4KDxznhB/FuzZIKHHDp+Rvy9qR+G8PuMjCuYML9/dpy1hzhrBL26Ci2qKJ/HPRt/nXdL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806949; c=relaxed/simple;
	bh=OoDKLuO9dujTB3nEG6ggwDbl9L3FIdm98JZoLWi0wlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwbF0pRWPSW/JzN7/hA7FcvYkMXsJGfXKdFcP6nBMRhz0VzEEpuhp2aXTwHU5tocXyOyJutwio/nvU2/Qm44TPStiGwBkCOYb6rNwIPk+dkX0jXjR8qlXauFjmblT4IdMcI/lZ+UtwqKYBqpff6rqRlrnhLN5PXw0Le1SC4nlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai8sspHB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649D7C116C6;
	Mon, 19 Jan 2026 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806948;
	bh=OoDKLuO9dujTB3nEG6ggwDbl9L3FIdm98JZoLWi0wlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ai8sspHBuqCsqimm0SCN9Ogy5bdEha5gyxMmkExf+9C6BLDpE66ZOsVkWYmh+fTmy
	 7ypWPfoQOzcMFUFlREdtpMqeSb4e8EBbH5yE0hQ4UfVBhwX+jawr/3Bmq7peEt1OiE
	 dCXzbJVJEqamJB1ZCR0t8p9dSmwUYavg7rqKzvHgft2+4//hYDJ5A0b+aT5HN5d1jj
	 CmR5X4N5BXSBrFlCcmwlNxxEIfZVsj3UdHCmJHeBAAS9iAfhDTV6CY8DGtrWrz6g1y
	 yEVGYjuZ+JmjOQ6Sd9IkcZl0xlhimkt8rvMZ2euOj1SHxRBq4zFRChVKtllQ6yxTFO
	 FBAzJ93oou01g==
Date: Mon, 19 Jan 2026 08:15:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org, 
	laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, quic_jesszhan@quicinc.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Message-ID: <20260119-annoying-eel-of-election-ef4be8@quoll>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
 <20260119033035.57538-9-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119033035.57538-9-bavishimithil@gmail.com>

On Sun, Jan 18, 2026 at 10:30:32PM -0500, Mithil Bavishi wrote:
> Add samsung-espresso7 codename for the 7 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


