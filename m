Return-Path: <linux-omap+bounces-3035-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C9A06728
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 22:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8473A6442
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 21:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023B204695;
	Wed,  8 Jan 2025 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR8nZPyt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991C2040AD;
	Wed,  8 Jan 2025 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736371450; cv=none; b=gjrhuK2rE3e6xT+RUUQLXbVFXXaBYdZht2akaEFUXUd7K33qHZrrZDMXyy/WyPA+YaKAivoe/MKbST91yoVKlc4TlLy9Nmy0ibtkA1dCdi/bZq5aY1Wjp1UkTL0zzwxV7Gg1ugPi8f7qQ1aJL6xxP9K8r0CF+CpYFnNbROGFoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736371450; c=relaxed/simple;
	bh=99O1W4A/KkPlmC0u3XNovrq+7OUjFL40eD6RAj2PfP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuXFE0fzSDrOjf1TMJ0DlPFKXwFAfNWsZGoCZAqHu46JdGNCH2zlJHHBCR/QjYhlR7Bamv+G+VhwSlw3OI5HJD5JfR5hQXm4WHTA6NTsKD5X/dgZaBoCuH2esFW+9lRr+ks4otGi2adK00Nb71qxlqvLJNbuu/Sflu3dxsuh/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR8nZPyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8268EC4CEE2;
	Wed,  8 Jan 2025 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736371449;
	bh=99O1W4A/KkPlmC0u3XNovrq+7OUjFL40eD6RAj2PfP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VR8nZPytqkUwgu8On7AWRZ24Ro2iw4gaWjNtBT8lAvdPCwteoBNyOiMay1yT6yd8N
	 hEXYPeg6/kQ1m4pNuxIKcK+Sd3olKV9lB3TxNpEYmPLRH6aQpo6dh3YfMSydV3CwC8
	 4h9jD0Jh0I1dc/++K6rrPaz5CV398UbjBrrk+niuUTacWA8vcNoTbyIbYgwbPJfqRD
	 drPzm+ATo+b8Sq0fqYFsN7x5Jscw2d7Nx2bAzNU/A0KkWYxiWazqjKOzQWqmsY3/VQ
	 NMaX0ONsYrdRNysz1E4rl1Cdnwi0aFCvJYziNPpkgEyqSYhQdCusZM+oeD0AExQNO6
	 sirDQomyqaTkw==
Message-ID: <9bb10095-2209-40e6-a000-d98ac11e215c@kernel.org>
Date: Wed, 8 Jan 2025 23:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net] net: ethernet: ti: cpsw_ale: Fix
 cpsw_ale_get_field()
To: Sudheer Kumar Doredla <s-doredla@ti.com>, s-vadapalli@ti.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, gnault@redhat.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: t-patil@ti.com, j-keerthy@ti.com
References: <20250108172433.311694-1-s-doredla@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250108172433.311694-1-s-doredla@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/01/2025 19:24, Sudheer Kumar Doredla wrote:
> CPSW ALE has 75-bit ALE entries stored across three 32-bit words.
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions support
> ALE field entries spanning up to two words at the most.
> 
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions work as
> expected when ALE field spanned across word1 and word2, but fails when
> ALE field spanned across word2 and word3.
> 
> For example, while reading the ALE field spanned across word2 and word3
> (i.e. bits 62 to 64), the word3 data shifted to an incorrect position
> due to the index becoming zero while flipping.
> The same issue occurred when setting an ALE entry.
> 
> This issue has not been seen in practice but will be an issue in the future
> if the driver supports accessing ALE fields spanning word2 and word3
> 
> Fix the methods to handle getting/setting fields spanning up to two words.
> 
> Fixes: b685f1a58956 ("net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()")
> Signed-off-by: Sudheer Kumar Doredla <s-doredla@ti.com>
> Reviewed-by: Simon Horman <horms@kernel.org> 

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


