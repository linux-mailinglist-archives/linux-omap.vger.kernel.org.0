Return-Path: <linux-omap+bounces-3233-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1AA1DC5D
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 20:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE033A7917
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 19:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE6318E351;
	Mon, 27 Jan 2025 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aui4BWdy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5877A59;
	Mon, 27 Jan 2025 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004449; cv=none; b=BnvKzjE1ThrjDxRjoMnb+PaL8Gzijq2paw1bZ0mAQYdQyUhd9LA8BDPPGs+3YYd3o6C347sCwD8VZIwPJ5Wh+D/4Qz4diZBEuDM5hkM3YvhZgL5fsjoBEE1Hk2OUweSuQlEzxphPgUc1QuCiA2vop61HNEZ3aZfAxjWPvYkvFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004449; c=relaxed/simple;
	bh=2ARNO6omE/yQKh4pcoqssC4GzJzmWuZ1esRzcAUWJjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWb10yxqJnYxJBR07Swe2em3Wk+SmSR81MOJLdNdI7QMuQBj3UeCsuLsCEHMWrH4q7ZFOgIn2l2MugzmQLX5/NA0GCgLgWlpDRY42FHRdP1XdOlzStr/0kSlafsrNmJ57qWpsxEjP75tmBXrIQ14Sw/rZBcJQgxK+eETlA4zwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aui4BWdy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD019C4CED2;
	Mon, 27 Jan 2025 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004449;
	bh=2ARNO6omE/yQKh4pcoqssC4GzJzmWuZ1esRzcAUWJjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aui4BWdywJ/w6N0pUPaWyVmvjJOXoHLjjxuHaCbI79iohE+ov9eH/3VJcV3S9Kurx
	 6Uob3RjePZw9anaaJd71tCKA02O85sQO1OTZF6syKLeod2w/0obFXYV+vrMy7C2ghc
	 QotHEn0CQU7kLA8+3XNEzoOZOAqyuNJxH4O3wlWZNiZ65tt5X/gldYMf6c7F1kHlvP
	 YXnhJy45mFp5GfVZl0U2lyu76lLhCWf6jk7sMFTwQb04RvYlkOhH6WQMt8F6yiXi1S
	 TDdv7rsn42Hak+7y42i9ebOSf4kFXLff0aMe05Z/oBqOfXORC7Pq0BiMycCiynRUVN
	 JQC9ums7MOoKQ==
Date: Mon, 27 Jan 2025 13:00:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
Message-ID: <173800444647.634242.1585056776564654006.robh@kernel.org>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>


On Wed, 22 Jan 2025 18:41:27 +0200, Ivaylo Dimitrov wrote:
> Add DT binding for the audio-codec headset detection interrupts.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


