Return-Path: <linux-omap+bounces-1625-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30191D90F
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99652822BC
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902017406D;
	Mon,  1 Jul 2024 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3DiTrUW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FF8286F;
	Mon,  1 Jul 2024 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819372; cv=none; b=tHa1sAnHkWgyRTbFhyJj4F1lo3S8wkbkoqL+P93CPbd8u3O+RkBCSpM6fl7LfWlTZdOFIqJDcEo76o9flL20WeZIDwD5Q7m6f1/uR1DmG/qXQkbZ2F7XYyPDJovNxgWbdotmMMDn4OBeMSqJuBQX5eGaKEgR2dAgiDAG7rnk8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819372; c=relaxed/simple;
	bh=XQ8ABrn+S5xVKlkUu13432bS7MGmkC3UWOfGvra/azg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKnfW0OxJgbD2yGmnCe/5IQasn4BtikioANRfIlvD+Fiz/2KCmUfDOS0xO1Hj4zqu0t2d0KGh91O6jdypfhIWTp/MRZC7AymNjot74WnMoWAAmh4BdlGaBOYExv+D2ykw81uyPBgzj4jb/cZM03lfvctb5V3tgBYvmhuhkvKf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3DiTrUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E6C116B1;
	Mon,  1 Jul 2024 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819371;
	bh=XQ8ABrn+S5xVKlkUu13432bS7MGmkC3UWOfGvra/azg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3DiTrUWxk0DSpRWSajbW0WlzBQe+HQBspbOaEOKdNtw4AxwFOrR45QGWWtJqkOyY
	 pGmNMtR/s9GDxYXNYHQGYz08DwLkacG/hucFdUbh4zNWgEe0l0r9Z3eCMDzQHAGtFu
	 e5xP0u4FUoNbKWn5H1EliOafOHsHjPD+bmolTpmvzfB+9NatPLsk8Lo4h/9KmkDniq
	 YBoai6iLYkQLbqeAG+OfNKtS2+j9BtH5/h81AJQjSgf+kCBIVUw8eDBRTlsmq5pses
	 GAOPsDNyGb/hIgLa9BzsG6o14ZXprNH5+ylEuaInvZLiwjIGHMLtTfUsbt8aef9wVu
	 WIfUIBR+tisXQ==
Date: Mon, 1 Jul 2024 08:36:06 +0100
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
Subject: Re: [PATCH net-next v2 2/7] net: ethernet: ti: cpsw_ale: use
 regfields for ALE registers
Message-ID: <20240701073606.GL17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-2-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-2-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:51PM +0300, Roger Quadros wrote:
> Map the entire ALE registerspace using regmap.
> 
> Add regfields for Major and Minor Version fields.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


