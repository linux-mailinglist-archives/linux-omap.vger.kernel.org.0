Return-Path: <linux-omap+bounces-1626-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563C91D914
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43CA2821E9
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEC481AB4;
	Mon,  1 Jul 2024 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNEyY+36"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373347D3F5;
	Mon,  1 Jul 2024 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819385; cv=none; b=LWN3ryE6rX4i/VMTULdnh5cS7mznKWt76fTg9yo7T7bZQjj6KWkCibPVZ4U4IxYD+Hhf7VEHhEl+vNOjrd8RSYhpNlTrNq7YxyaK0mtZFnycbcEMnRtlF/zj4qsH/JnJ3EuwBY0ZLV+4SLjH0UvFUa15SanlUsFEH7Xur9u3Inc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819385; c=relaxed/simple;
	bh=px1yy7Z0jvbfD7zHRJ8pBffic+N5n2KmHRwKVlQqzI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9xZDaBEOVm4pA2HUw7ZUUBq7yfxmYdilqBocqRBvUkES/QV8WTn7GuQJbAyYcZf2K+xiCKbqGUIyAKp5UPQm2d5PnZW387FLyhs+xlIJnYPVhh5S6oBEaB3vn79eikmh01RS3qH63lIhPAfs53RXxaG2yaziVqn/Z2cjFwsQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNEyY+36; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC35C116B1;
	Mon,  1 Jul 2024 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819384;
	bh=px1yy7Z0jvbfD7zHRJ8pBffic+N5n2KmHRwKVlQqzI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNEyY+367dwIQ4Y+RQbQDFYTewb4A6c2VmZjaNafYmE9g/MyGKYGGAdtVzvb99z7z
	 wQ1WSD+PrjkSZUXkNJ8GwaKZ/P2Bp1om8ZG4w0bGQyUsq7AUeWk393/ynO9lOlxGaq
	 Wsor3gVG7RwklvJHwcNUnJgiJDIG6TBNLa8k1pXLb34+cCr073WUvV5Bb9Ycr+BCxG
	 aya9j7HvArJBlYh0I1hzh7KYUTmg0H6m2Q8OFatoZJjyaAQ38vOKJc+6Sl75zLycp+
	 cjRnp23tFRZS5e5uvbdIjl8sxjQq7J3yUOFN0rBQMNvIUq37PQ33CEZA2ZcoDSjuQp
	 z5YzM3jpz/f+A==
Date: Mon, 1 Jul 2024 08:36:19 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com,
	pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/7] net: ethernet: ti: cpsw_ale: use
 regfields for number of Entries and Policers
Message-ID: <20240701073619.GM17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-3-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-3-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:52PM +0300, Roger Quadros wrote:
> Use regfields for number of ALE Entries and Policers.
> 
> The variants that support Policers/Classifiers have the number
> of policers encoded in the ALE_STATUS register.
> 
> Use that and show the number of Policers in the ALE info message.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


