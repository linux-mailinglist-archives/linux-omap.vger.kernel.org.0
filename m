Return-Path: <linux-omap+bounces-2870-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3194D9F9CA4
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 23:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85A0D16B31C
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 22:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C4322756E;
	Fri, 20 Dec 2024 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSgqRcz3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77839FF3;
	Fri, 20 Dec 2024 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734732866; cv=none; b=V4t+5cnaCkEQSPfItfUwxnkztUxvUDOhLMGsy0RBNSS++ozVb8XSpbXqr3bxPaB11fTdKYypsnJirG8uWpSSJbCidyijRj23cUDZsMiz5MOTfLi26RECTzINUdJkuii/v0WDJ4qCjtSRIJwfTwW8io/zvPTdGEavCVPE0b6gUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734732866; c=relaxed/simple;
	bh=cclifsN9czpygmBtln4iJ6tYnrS6MD0vkHfje6pZsqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCNficNyRvyqnkF5EsNK5iwh6GqEffRONI/qb6PnNpbHYfLvyQsKLhIrvyDSYPwXsw4dDSiLieBgXJvLe0tDv/9fLcRHSwYVXUnCFrouSGvejmt1a5/PkfIo8vZxeaFY6N4jxRE0/DRDToxy0MKi+OWnJZarqVPYW/taEi1U1rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSgqRcz3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso3652469a12.3;
        Fri, 20 Dec 2024 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734732863; x=1735337663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzQTdi33STaA92uGhfMFrRrHPwrulTRHXWs8OkIwbWI=;
        b=FSgqRcz3R1apZAtd6727WQczgM87IXNIjtoarVm25SYGx37Tuzvhmx/0LukAo5z0XX
         E/vH5SwaWYmisHA4CsVj6KUFblZeA3NUHb3GSVYf8H3vFCWo6F6z2cwOqDD6RhnjIEg9
         6ZtmQiNgvPlXYAOm8Om3AVbbwrQ+wLqeoXcSBOZbmUrO6wg5Go570LMDGEDAm75Czg6C
         oyhBynTM1xnEVV2uW57cNJHbRR5LST/vYziMXlY3HvAtCGbxiWb4tcbstrFFnM+DEPA4
         OuDD0lQsWZNA+MFFjbPv6jOLPG8JB7jJv4g9wwKGbzyU2fxJ+tZrAeVpZpz11ftfLKjV
         v6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734732863; x=1735337663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzQTdi33STaA92uGhfMFrRrHPwrulTRHXWs8OkIwbWI=;
        b=Lah0CwFyfWB1mwq0FTE8+0yvRkkzN79/VcSJcDiyLuC1xKSdMUH7/XGn9tPSMr6rrV
         HydUPzzZMeNDnMV/cIIN4YJPbX34o5VHIFqGlFX1HtL5uBJSzRqZ7l2s3qv3ayIs9j3X
         NxJWjRGed7kEF9RwbtqbXQpAv6XXjJvn8L0rNU/9pDLuw8SsN08ZhoYATj7S+iK7BcTQ
         A9gKqwJM5GyTV5ASsidt7f8YmL8+amfw0aD8YAug9p0bRRhzPxynOOnY+zL9ImVMZYh4
         G88u25b2zsukhX2CzO9a0drAjxUN+0xnaa3ZZM/ghbcJeqOPqFrwE0G8D0YLJ3oNNk2r
         WTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4lb3Pv2uHVO/0jBr8wXZBIP/c26oyEgCeQ4amM/LsYlcbhif6MusA63qOe1wTKJzgVwQxk/7@vger.kernel.org, AJvYcCVza3XQzeOjTpjicP/rOSAWWuM0NgJvIPD7NKnjeRrsEAFk2+0S4u5+TPazvkxDJKGNxIqwN+fO2zYeOQ==@vger.kernel.org, AJvYcCWrzZqqPRg6p/zpHrTWuoMxSvFCvuaFzYrdA5f2dBx+G3td1Oxd4rSKpdVdlLKIa6kTprXUr8R+qNCn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vYbFwBSTydvDejrIt2QC0vLWwCdTifdXNFJdv21Zs8SDfmUa
	QOvVpzJckxuAmJ8B0llRoCdWf4TIq56bh8svEeu5l95+j/TBJiN9
X-Gm-Gg: ASbGnct3efB44iwISTVU1rsB9UdZtx/ScDy+VnoIWr0crnMWfaC8XdWtAhbVCFvaq6g
	vvJM4h3RSVZcvip8K4ahx98euHNmEwsk4UyYZEZzciEpXwhnQehuMMO7024bz1yfIuFBg2TZAdB
	qHpfV4wxd3npPXUoKDkhHpBkroBoqtU6C/bfkunmz5bzZzgSkmwgqcy4NHxB0jFZYvFWTkHqxtv
	bMUsYwq7La4ObjjgG+Wayyle48VSc92zNorOUnz92tdlk+Olt43UCogBjIqvXJ5bM3/Qc/TV0cV
	2m1zWZEYp/8zd7Eyau5XJz18QX+Bht9aXUa3l7PMU7mhB00zx1njbcrwltK3/bDAL4h8bUYkFjg
	nyVBu7Qfn2utM/Ja2Jsc26p8UGpI8tBTXexxehFbOSNIiQWrr
X-Google-Smtp-Source: AGHT+IG5fOLNAd2B2hZ3HzlhbTWgl0PQlAa00Knd+/hC0t8S492MEKBci0l7m8D8eqYnEwBQNprZmw==
X-Received: by 2002:a05:6402:270d:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5d81dd9cdf0mr9276411a12.12.1734732862421;
        Fri, 20 Dec 2024 14:14:22 -0800 (PST)
Received: from ?IPV6:2a02:3100:a560:5100:791f:8fec:e499:68ea? (dynamic-2a02-3100-a560-5100-791f-8fec-e499-68ea.310.pool.telefonica.de. [2a02:3100:a560:5100:791f:8fec:e499:68ea])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm215897766b.198.2024.12.20.14.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:14:21 -0800 (PST)
Message-ID: <f46b186a-b317-4b3d-82fa-793242b323f6@gmail.com>
Date: Fri, 20 Dec 2024 23:14:20 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: add and use phy_disable_eee
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, tony@atomide.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, pabeni@redhat.com, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
 <7128fc70-895d-4622-b12c-eab2475e3049@gmail.com>
 <072064ab-50d2-4517-97df-73acd9262103@lunn.ch>
 <20241220062519.63d35267@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20241220062519.63d35267@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2024 15:25, Jakub Kicinski wrote:
> On Fri, 20 Dec 2024 09:40:38 +0100 Andrew Lunn wrote:
>>> Patch 3 is marked "not applicable" in patchwork and didn't make it to net-next.
>>> Any issue with this patch?  
>>
>> Maybe Jakub wants you to submit it to the TI DT Maintainer? Or get an
>> Acked-by: from said Maintainer.
> 
> Indeed, we got screamed at once for applying dts changes.
> I filter them out now 🤷️ Sorry for not letting you know.

OK, thanks for the explanation. Then I hope Tony as TI Omap DT maintainer
picks it up.


