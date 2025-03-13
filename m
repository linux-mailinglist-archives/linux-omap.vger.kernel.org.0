Return-Path: <linux-omap+bounces-3383-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6CA5EB7B
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 07:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E0DA7A60C5
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 06:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4D71FBC86;
	Thu, 13 Mar 2025 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kED28Sjn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C311FAC4A
	for <linux-omap@vger.kernel.org>; Thu, 13 Mar 2025 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741845928; cv=none; b=epaRj7D09KDeZhWzm536fGvcC03cT9/HdZu4AZjMr9SbipM92hBVs8qzIPmqD8xUrkNwpb4lFPVXac22/YcrvnZMPy58Yq5FvgiDBCjhUPLGEhTr+68N6R4Eschc9uMLRh2EW+xMOTJR848gHvcF5+i82Gvy0Zv34yGNmfRJg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741845928; c=relaxed/simple;
	bh=xnjEUUt219szQVqS0FUbXn7jZKDT0VQ883gSiPYS0ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljgS+mTXq5wOBe8hdCUpJqN2ORAG66+VW7nLdmQOHrSXPYbe52YMIh0c+NpVIJHPXMDP2xVHC7OGQUJOely5puXaQSsR69P7stIJCqxMfoA+28YdIFRKUBKtX7TllfEUh5Z3r/DHah/aLi/SBveqWVU+Za7TXQFL7tEAwALDEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kED28Sjn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22355618fd9so11034315ad.3
        for <linux-omap@vger.kernel.org>; Wed, 12 Mar 2025 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741845926; x=1742450726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECQXFTKYOwgoxNWOGHysFhcD6t84a8REZICN/4jtZ5M=;
        b=kED28SjnwcZto2IkTRX7p74kNmvwWpgjG6u07C0SY5sCiPVDpwLSPgdVl90OutwA3e
         tA1Fm8OwFXs7In07wqf3aVAAfdZOmvAS9CUsa+0U/kUm6sUgDJWg4tSrwKl65vpZ2x/D
         z6Ok6f08iTefTmi5gyABqQNlvNhLVUFR/1n5BaPd2CZH3Ba4GO/VNmBTSAi63e6ddx2L
         Zlkm6OUKq2fSOUtQZedR14BwP/toHrhOEmYl+OyIRTsdb9JLhWqq+XZ8pEWH9JCD3sk7
         fzpNITsP9Wy71Go1ygTpeVV+/4kftKFS4mkB4TGusdxDVnkFMpINqZHpJP1WisrNeehs
         BZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741845926; x=1742450726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECQXFTKYOwgoxNWOGHysFhcD6t84a8REZICN/4jtZ5M=;
        b=LSx31eIdJ/Vljzaf6Oy/bR59si9kglYpgMXtLRrYg4HOTe2Ydtxu8xrFruPqJb87JG
         0hs690I6p4ucZaL0I7AR6RaO3Q4rlaFYPxs4cnTWFwdO843KEs6Rb0+qtYSL1XNxBw8X
         qD7NtLZj51Q1L8YRKIslh9f3UxsPjT35V5IiyRoipaecn74j/mJ66RcnN8ts4B5ZDjmt
         Z9K9zlz4oOGGZOCECm36QIG9g8g1V8e4OmbYpFhRw1gAJfYMQS2AnCiNJQhIW4Kr5S9q
         6DcwvpnecQjQaOosH7D8/wEIlQgJ67AaXzv+PQIEuQ9S4A4NyreLnID/2OQBjo+HOIx9
         kLfg==
X-Forwarded-Encrypted: i=1; AJvYcCUMp9FJdHBZPZYtOQWBZiHt6IaU10igF/bvkiJa/fdJAgbrtY5VnrfeUWtJycxVKEXl0d5WmnR4wkq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd/XiEo4SQ/HW0ypgdcdNvR8uqhyYr+Rn6Ijt8+9hqHvgyhQ/g
	EzKtdNf5JxypcQm37T+Hb6JSMZBzrjxwsGtod4F/cq48wPB4VUGqsrtq9IH4IQ==
X-Gm-Gg: ASbGncudSQppD3knzYNyQ0TFHmAXjBRsf3FxB6jxS0Lty5jzvbCraC+XyDjz2kIAZs1
	lvzeUS9KR7Lj+xS9Bekh4NW4Zsf6GB86K3FsPKv6F0TTw+R9f93WDXylqXZv4ZKIj7GKaZCGacV
	nyJ8nTdI5x0BtvLBd3NflMu9DtxlkWIR0Jobjfj3qmO6JbrldJW7CCEaDH1HxVFjEhQ9vrnjJBu
	KPfuegco919YFjw5jt3qjU6IuMYM24ay81UihnQRC737NCB1A9sTRCFgW0Ea+bu7ZKhKwoWdsWs
	rtPQ3IEaSQmQhhvOXZJlxN5boKC+cx6ZKQybEUsQddBv10iVSHSxyQ==
X-Google-Smtp-Source: AGHT+IHNYbI7b2RsxEIqYIkLTAuLCtKd3n8R178hhBoO3FhGxq8OJi1CT08xESSMe4ltVJpCSclHjw==
X-Received: by 2002:a17:902:ec92:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22592e44a09mr126226875ad.23.1741845926623;
        Wed, 12 Mar 2025 23:05:26 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115781f3sm534483b3a.76.2025.03.12.23.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:05:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:35:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <20250313060521.kjue4la47xd7g4te@thinkpad>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>

On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> This patches basic on
> https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> 
> I have not hardware to test.
> 
> Look for driver owner, who help test this and start move forward to remove
> cpu_addr_fixup() work.
> 

If you remove cpu_addr_fixup() callback, it will break backwards compatibility
with old DTs.

You should fix the existing DTs and continue carrying the callback for a while.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

