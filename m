Return-Path: <linux-omap+bounces-4689-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95802BEBB3C
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 654AB4E2FE2
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D9D354AC2;
	Fri, 17 Oct 2025 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDarkqSj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F9354AC4
	for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733568; cv=none; b=FzcZXYwCI5g0As4ZCcQow52itvQnkKmKpnPiBMTQODomOXmOz682tFLN3HSCPb7SBNfzyJ29+AzG3fXGt41AXk/OJw3j+oyyp8ximwel79ax89+YdNG0DUJ65yWEzQ4shcYd+27sGHZTsM9zD+Lulwrn0gS5tnKIbU8pdY04Pig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733568; c=relaxed/simple;
	bh=pOdywwcuWxnM7fhmeK29h2b+NOU5yZObF+85taBlX14=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=NiH8h6FnrIL8gzo9XqAhG3npXTIrt6zi2hujZrj432HYOhXPDzGS/S7mFKvwNJPB7Wt1lIr/PKsvE6mX2t25amswDo2XlRBLZekhn2mbGTP5vz4HduyQyDyCcCijfQ4asR0BO8E2zQMMHO1C3BUxQvbWMl0bCnE4TlijaI8o+x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDarkqSj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso2162709f8f.2
        for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733565; x=1761338365; darn=vger.kernel.org;
        h=content-transfer-encoding:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+WQpTRfPlqj95XL4teQctqLR82Dt/i4sqVN+jGQCFI=;
        b=TDarkqSj0ECApWfin4uyQDhls1iM0x4Erti8Kd33yOMTW++yZSL6EeEGveEtiCbTKZ
         FY8VZ19gZsZAAiW9KFjpnjj+yuBw301b7+E4f7vwlTqoiSuZvxZCdF9Og6CGdnzrBwJy
         ooSp4Cx/fVizw1wE90pcingf41zcvOeWYhjT6W1jA0YaTnVuWuRIDyAKztJeDY2ZPnBv
         9s5oBVQzLuY6hckPzFsh7GR0AB7vR1s7Wrr9l2F2bbA0qMAnmhSZBxKGeYX0bx8ibBrm
         m6L/x34nFvS1XIA6kYf2Y9yYXemcplRBKyOxwxq6ubPejXd1goQLDb97gno/DDbuQIfB
         QYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733565; x=1761338365;
        h=content-transfer-encoding:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WQpTRfPlqj95XL4teQctqLR82Dt/i4sqVN+jGQCFI=;
        b=AztvJF3bQBF7IDqo9qSF6syoDTWWSqozV+slVAiqG6+X/zKbqA4nCRm14bE7nqh1Lo
         cZznIkzZLvlW6BOYkHoLds33lcJ5wZ1EFIFQn7N8U7i2b0PV6iwKcYFRE9B7ya1WL80/
         Dkc/teOVNvMXAK0eVkPXRh12wAXryny+m72XtfTk2We2ctVWRkz1+M+dQ+vEegqcAsYH
         mp64h61Qh4muu6ZRiYRAEEmUdfqEBHPDzTOTKuxOyc9J0aMZ8FUJ2upjYTWcetk+MJzE
         4tOgxJJln9qGubKyT16WAT0+G/6P2SR/rutdiFVNSgNtwmMEsPSofR4j8M3nmhQvULe3
         NX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHJYps1LXcEuzIQy5BtwWp2/TvOVWGWlNHnGw+Cn5DVFA5Ysy+wLe0I0LjNuElTgOD9GuxIs08VCNs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywonz7GPdnyS6XZe0HCcpj9NM2NcRHOq73zOw+D4vaG6eHMdwX9
	j9mYgbpaZjgM9OlDeSxxdcMwsg7DHocS9hnm+IeorS3H9ls/gPNEbZWb
X-Gm-Gg: ASbGnct1mG6gGAMvhMAqcLymm03S1CcZgQLe5CUAWuHYkz6zqoK5eJlctzN0Bk80o78
	aMdarftJePyYukLpSaPmw01gNrroDO6e0RwzAXuVBsAMU08xEPROBFR60mvflWo1DpM49esRzoL
	VAyt9DLorriM7CMqmBGdPOhJ5QczBLi0v+JMFyHeMM2V8Wxd3olTID9FBqvZvbHGQFxaS20qtj2
	ZW6QpguE2iHvfLqbbTdS2sUZtKNeDuHPgqf1oR7rJSt9vf5iFQhqLLLdMPt98Q59ifJ99z6g/fp
	zgr8zTphfA1C7QKpY1xQE83lpkgUas0HvAl7BdlmSgVZXrbq+ZGZxPZQq5TLwKapiM6zWpmB+T4
	Iamv01RwN1y3i2IPueRuTwbini58h//NubDz4MNP6aZfshgJfUYNx8G31aeC9XDIlxqHdSnM5ZD
	nO7zRZUlkUablWqQIAqjz8ZqPy5l2Lv/XsW3a17BgYUfx4T8LQaGP3U6RxPIIJp73OGC7BJLIjA
	3W0yfmI3CtRBFYC81+hYyVPU/TpJP1ab4x/jvy8iayPpUFt5fI=
X-Google-Smtp-Source: AGHT+IGw1fqnps6rMZSvWDTg9UVcVtgj3c4YZD033GS5xD0FfEHqCJ67XztOm1sHe48Zzh/q+Dexpw==
X-Received: by 2002:a05:6000:2586:b0:403:8cc:db6b with SMTP id ffacd0b85a97d-42704db4467mr3840604f8f.35.1760733564987;
        Fri, 17 Oct 2025 13:39:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c65sm1072411f8f.15.2025.10.17.13.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:39:23 -0700 (PDT)
Message-ID: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Date: Fri, 17 Oct 2025 22:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/4] net: phy: add iterator phy_for_each
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

Heiner Kallweit (4):
  net: phy: add iterator phy_for_each
  net: fec: use new iterator phy_for_each
  net: davinci_mdio: use new iterator phy_for_each
  net: phy: use new iterator phy_for_each in mdiobus_prevent_c45_scan

 drivers/net/ethernet/freescale/fec_main.c |  8 ++------
 drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
 drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
 drivers/net/phy/phy_device.c              | 14 +++++++-------
 include/linux/phy.h                       | 11 ++++++++++-
 5 files changed, 28 insertions(+), 32 deletions(-)

-- 
2.51.1.dirty


