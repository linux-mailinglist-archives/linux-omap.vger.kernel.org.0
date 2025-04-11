Return-Path: <linux-omap+bounces-3575-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC77A85093
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 02:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E96C16866D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 00:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09616AA7;
	Fri, 11 Apr 2025 00:34:48 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DAD2FF
	for <linux-omap@vger.kernel.org>; Fri, 11 Apr 2025 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331688; cv=none; b=L0UcxYq6EXfaI8S+zf5gaXgzgv0Tdx1otMXYi3JKx3HnkjaBugmGSXw52xYl+iNBJpCokp8d8hTLXusIPvyTPlIhlnzAydS5ZVgIRXl2MdwHmg2ol+tqhBCiZMvlBfhUWMVNyHKCSW920IlRWdKxRuWp6ubEVdCri04I8rGNPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331688; c=relaxed/simple;
	bh=2n9pQ7lqkOTFMiL/4NeGhhQeB/25Nn+RC/N+U/7ad+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z/Caeh8poQHEcPR3EL7UybKxhM0dlM0myA8hy5iwZKnH+NjvH0XG/+nvs0RitkLoiCUCCgt248yDcDo5kuXP7cgOzumPQDs7s6uk5GzmSTCGnm4kX/PDmH40foVZXkuB7u5M2Lc1xFSQUKJF+bbsrIRSVC0E0hwHqZ7TqGHruYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1456781b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 10 Apr 2025 17:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331686; x=1744936486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n9pQ7lqkOTFMiL/4NeGhhQeB/25Nn+RC/N+U/7ad+c=;
        b=JEjiNjr7zaAkpAB97WMG/NjXhTFPrqc29AwlAIOLfr72uPRvBh2DGczss7nJp4aVcI
         Dohr2+K+ddbPi0GVZEztzuoQJuArSr4ezjWX+85cAweY/rMDi3FwKG+qvIduN117iMvT
         Y4Pch/I9LGe+EuaNUd6yQLLqjbvMJNTn5X+zdjOCEvgEZ6UulhrO4YFfbH0+Aqe4v4Or
         3RXt5q+bZTaLi7LohdZj3EvJOe8KejrKlFSvr1ryAEUqy2hazUp2RZncI7KGVESrYALl
         R+z7Alis0XN9hwb+HII01icJs1btQhrIN6NIeUStfwEm/XbCwbRhpTlF/jR1/I9s+KpL
         mtEw==
X-Forwarded-Encrypted: i=1; AJvYcCUYhKkUGT9hxYWjTcGh3qkVPZYzOnIA7qQdnKbNBo+6NKI6AuAMnD8Zd/PTg8Z8pTExfUIWkqO2jnTO@vger.kernel.org
X-Gm-Message-State: AOJu0YyIznxzcmKHz4RfH/kc+kLmI6YuE8CYZ/sE9kHY4vbSoCk/VXgs
	TPl1Z+dxwh/7ZSyqU1KN1tjEOPTYj4CcQIcPmjseHxtyozzCYHiAZ4LlB6hOlEE=
X-Gm-Gg: ASbGnctSnT23ssN/GdMvjccnFpAma3kD1K7HA0306EwcnvMKGkp1dVQEZTeyFF8N/jp
	b6Jb1iXgav6Rlkba875dq9qrTnpLAvfa/iZA/T66yvWD4DHEuK06mhJaO4hLzSG6UgRFst6ji+T
	BmyEcqeIFkZmCkL7uw01e7kJK+YhPq04My4A/BlP5NaFim0zRY9pwcBDB3N/g3ZRFtszMr7nou0
	5LadLjcNc3pKQTlxOkfCkENJ3Kip+HLk47ODbWvhMh1xRmQuOJfrI5YZT9Gm2WyN7rS5eKXo6gF
	8YLyxlvJ8lt9HjYK286IxIQu62FeYnBpRiz4q9k0GkSX4vcJzg==
X-Google-Smtp-Source: AGHT+IGQAAV5woR4RVRjXO9TpIAsphvWKT0jMORsfI7xQgrPS++t8q5XWvn8GDPpegpqJNYEQ9nN9w==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr1046946b3a.0.1744331685906;
        Thu, 10 Apr 2025 17:34:45 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f28sm213644b3a.97.2025.04.10.17.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:34:45 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ARM: dts: ti: omap: use correct ohci/ehci node
 names
In-Reply-To: <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
 <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
Date: Thu, 10 Apr 2025 17:34:45 -0700
Message-ID: <7hzfgnwn6i.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> They should be named "usb@".
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, queuing for OMAP.

Kevin

