Return-Path: <linux-omap+bounces-1599-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D19185C7
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 17:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3811F27BF9
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 15:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BD018E745;
	Wed, 26 Jun 2024 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NF3L7F+Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4071849EF;
	Wed, 26 Jun 2024 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415690; cv=none; b=RKkvbDU5bbzf+BI99rSbxEskGvXe3p24kTZiuacOFBSXSKE1XlNfajpGU1D+CvfnSuM1jx+apg9QQvy5AiVL5JtSSQCjOjOSvg7DvvCdFrx82JEnEJUfEPfYvwqYOMMtsgIp+soB9S5elEsakNS+Qca4pOTCSVXZIihzmvHeIRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415690; c=relaxed/simple;
	bh=oftg5qyHh7ZU1QzTy8K/ZsT7RByc3bxl2UZLBCjkcZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AqON60xdmXYEn1VYvND2VY0z8oJ0HjRn5wacaYSdwfOOaNJX4QNRaAu/i3bOdsb9PPlFg7QQHgDDEMIlcAtO1nZZO8BKJBFhMibnn+wggRCaTjkM5PBxCZ9hlhtd6yvjNx4gl4H1H6/1pbrQJ846QF2rzDpfnR6svmjlA40e6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF3L7F+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE2CC116B1;
	Wed, 26 Jun 2024 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719415690;
	bh=oftg5qyHh7ZU1QzTy8K/ZsT7RByc3bxl2UZLBCjkcZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NF3L7F+Z7pjsFsieNVeNJG+Irbp1h1ptHoruy5m8IVASS8BHfNdy8mYgDjFaVIQEV
	 wOWSkv1E7/2p1/lM8jUxvlwxLxBBCyMIryBnZZsYgNRX5OTZw9EKBcAVva8Nz7hclH
	 g9f5w9MtHMIB6zsm+TXSnlZfj1SXrMZNf+0/zNS9ClprXGObQRAZRPzQGzgV4UCjfh
	 BfuFPDLkhViZGJAGFJcmSE88nE/42RychMwtMXE5WUDgw5+G7Tj+AuhU9WpD7Zb/sJ
	 hgsH3NDrNAq2SjQ9I4JaDPDAFfY7Bs5FL0O0st++SRU9043AS9l8DUsojWWcnDSVSg
	 qcq4ht8EGygcQ==
From: Lee Jones <lee@kernel.org>
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-1-77797834bb9a@gmail.com>
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
 <20240620-omap-usb-tll-counted_by-v1-1-77797834bb9a@gmail.com>
Subject: Re: (subset) [PATCH 1/2] mfd: omap-usb-tll: annotate struct
 usbtll_omap with __counted_by
Message-Id: <171941568853.2512668.12265367798667134639.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 16:28:08 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 20 Jun 2024 23:22:33 +0200, Javier Carrasco wrote:
> Use the __counted_by compiler attribute for the "struct clk *ch_clk[]"
> flexible array member to improve the results of array bound sanitizers.
> 
> The comments for the variables are no longer needed as it is now clear
> what is what.
> 
> 
> [...]

Applied, thanks!

[1/2] mfd: omap-usb-tll: annotate struct usbtll_omap with __counted_by
      commit: 621a62fdd279b06c23bc6c3073b8fe52b5dc356c

--
Lee Jones [李琼斯]


