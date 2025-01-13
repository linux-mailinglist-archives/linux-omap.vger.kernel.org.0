Return-Path: <linux-omap+bounces-3098-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DFA0B915
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 15:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9533A643D
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 14:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705EE23ED61;
	Mon, 13 Jan 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spJ39n2L"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084923ED4D;
	Mon, 13 Jan 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777303; cv=none; b=JSGBIas4n62gXukihGOGYPJ0eitnaxINBVW3d/Qxa3g8M/absfwJKxL3Ry5WDl5rMrttRdj4QD9VJQ0ZjwsoLZrT3xcsmxu8/GPAGmLhfgeqT60plS30IgqJjOERVyuPUxtbVqhXtVTFgig6KGQQ61xEbhaT4WJLHbZqXs2rr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777303; c=relaxed/simple;
	bh=PQEifYdxBu8qJTvMcQwP4XiBVXlaPfExmJUXZK2bsCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEoPh313AG3GKCQda4K/hoTv0Kc9l0/kXIXNn8fkvODdBtrNW8yVW79XZWNguKCpOLfLxH/CV7rBXf7qQtAXvYOUIq+jQSO9k5X5Wu1WkCx+b5BgU+3+OeFcUgr93BH+WH+cKi4xw8TVTMKeQal/Pvi9KQzTayUsyVMSjiTP5Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spJ39n2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E672DC4AF09;
	Mon, 13 Jan 2025 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736777302;
	bh=PQEifYdxBu8qJTvMcQwP4XiBVXlaPfExmJUXZK2bsCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=spJ39n2LKWZcyX7jOhCgcDl8aFaabMbGPXbrJNxYFJjRsUWBSZOC4l60fRd2Kgd0N
	 CrQg7wFO5HAcKB/8sI2dEmqBCU1NUeVBf/qBHfViYjpwSOFvn3gHHV022Q4UI5Z6pM
	 S49HI6Ld6SW0STYCJMkymdfq+Rdp8k4fkpi7kyByw0PETsMQQOoAXpuBYHI1DZ3KUa
	 +/aDaOneJ8Pnm1vsRBC1noxEmPe/JGsJfurXZNeUprRLEKMJxKO1wpk51cCaJITKFk
	 IX4XHdTCzbvclFtM9PBURerZZxjmcw9dVS76bx5uTSRnoAaFVgWq27aAet9JglmkAA
	 kF1tqJ74xkO4w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540201cfedbso3915658e87.3;
        Mon, 13 Jan 2025 06:08:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaBBKLIL7nCU7rgqQFFQhzcDVnUNMq9/XTmRHLqdv3YtkNmI94tsY3AedXAL5xljSwTNTxE/epW7Zj+g==@vger.kernel.org, AJvYcCXSuJBGyUJUL6SVNjN8sgREqgeLzP3XYKko0tFkqOYSqDzTvBl2Xv1GIzFv0ajWJbZrvJn4lnII1D0CeNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbqsmeL/dCu2eTlosaTY0nhQx7UD10EV9oVsL1bq/o0skMjQYs
	Y6DD5jCG0S/OtjBmGxuF9YCu2Oq559Wz05F+PoqXKTr560sQ8kmcLEKQOw1F52pJenz8GNVRiO8
	NIgg8jTe7xcstr7iZiUO1CiEb1A==
X-Google-Smtp-Source: AGHT+IE1H1bRSKQjFQlMjB6ysyK+qdUHVM5FjfDzirriJkMZ+yIiNrTsn69jxVI2VSdD9HH/Hb7WTwx3KV/NVt1Ekpo=
X-Received: by 2002:a05:6512:3ba2:b0:53e:39ed:85e6 with SMTP id
 2adb3069b0e04-54284546fb5mr6399578e87.32.1736777301179; Mon, 13 Jan 2025
 06:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109182110.3970894-1-robh@kernel.org> <75ead807-4ad1-4f82-8ce1-dea68ef9d9ab@kernel.org>
In-Reply-To: <75ead807-4ad1-4f82-8ce1-dea68ef9d9ab@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jan 2025 08:08:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHanejGiUhc78M7xCUPaqvvXojben0-m83HrzrRogpYw@mail.gmail.com>
X-Gm-Features: AbW1kvbSfBXVqq0Amz-MOSQfrpKTdN592CKsgn3i4xk9q_8fSxO3YmUbcTZi2cM
Message-ID: <CAL_JsqKHanejGiUhc78M7xCUPaqvvXojben0-m83HrzrRogpYw@mail.gmail.com>
Subject: Re: [PATCH] memory: omap-gpmc: Use of_property_present() for
 non-boolean properties
To: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:08=E2=80=AFAM Roger Quadros <rogerq@kernel.org> w=
rote:
>
> Hi Rob,
>
> On 09/01/2025 20:21, Rob Herring (Arm) wrote:
> > The use of of_property_read_bool() for non-boolean properties is
> > deprecated in favor of of_property_present() when testing for property
> > presence.
> >
> > While we're here, simplify the 2 checks into a single check as they
> > only differ in printing "NAND" vs "OneNAND" in the warning.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Possibly this check could just be removed altogether?
>
> Yes, I agree it is better to just drop these checks.
> Let me know if you want me to prepare the path. Thanks.

Please do. You would know better than me on the details of why it
would be fine to remove.

Rob

