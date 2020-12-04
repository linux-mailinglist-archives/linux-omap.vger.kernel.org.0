Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3E82CEB14
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 10:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgLDJjh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 04:39:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22475 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727373AbgLDJjh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 04:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607074690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=apkPa8AtY5qI+Lx8h0RIJ14ymUykNA2gmtc5uu7K+b4=;
        b=RRuZXN2GmE0+GdLYxJTi3qdLN3np/5k25mZu/wdZVBNpY17OE40xPRp++jx8Smxn+/hgCI
        xFgvPWPlcvLPj4lzPT+trdyhP7ih+cGjrN/7JA6kcmmU1zCYs5Na2GvZb8XeldU/3V3P8l
        GgBCcnXd4YEKOTWkxJhABysoiCns2xQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-_Dz4KLVyMMKL-anzPifUnw-1; Fri, 04 Dec 2020 04:38:09 -0500
X-MC-Unique: _Dz4KLVyMMKL-anzPifUnw-1
Received: by mail-ej1-f69.google.com with SMTP id bm18so1856458ejb.6
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 01:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=apkPa8AtY5qI+Lx8h0RIJ14ymUykNA2gmtc5uu7K+b4=;
        b=NW49H1y9utdAJfLr6OlULoK7QbCN3lismdgwveBow/FTqtwjJ9OGQOXgAOC53LvaLD
         fZ1YYLSCqgSJUM6oJFtlLpEChfFThaYn1cKzgfjIHC4gSDiACLGbPDz2gbH0UZFV3srA
         45lWQeVdV+1CkNFqXuRMiy1VXcn34ueXsue4PyVUUvDxe5bgeyphRLm2MOqH038iWTb2
         +JbyYhkbFI/JfHfKr4SQKME4iC5qhsw1cH8RoOHyKNg26dTVrfijb+GujCtxEQLVaju0
         ohJUrE2CZLRRt9FwKwRE5SxDrf5ZSb3HtP8r7oKW4pM6ulYYLsy/9uh+pJ2Dz46YSnYq
         rCBw==
X-Gm-Message-State: AOAM533QRhOPUExzORyeZ1YXVXpVmzQChvr5Xmn+4AjUzBOTbA+WB29Q
        vwrzvTbdFBY2pS3VBB3sQdLoLAl26iYMQ041vnBJYEoXdE9w7P5/iW2kjPk1R46DTTW8bchAw1p
        AR9K2YGtKeFtUVDW5ryyZcQ==
X-Received: by 2002:a50:d011:: with SMTP id j17mr6689749edf.123.1607074687976;
        Fri, 04 Dec 2020 01:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNxFWO6FFyJVolGD9Pye9fYp5KlEmHb8yz/DhNIY2dFq2yCkMGo0POHRcDRXgqhAgUGBKsqg==
X-Received: by 2002:a50:d011:: with SMTP id j17mr6689728edf.123.1607074687761;
        Fri, 04 Dec 2020 01:38:07 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id t26sm2692268eji.22.2020.12.04.01.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 01:38:07 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B6322182EEA; Fri,  4 Dec 2020 10:38:06 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andriin@fb.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Simon Horman <simon.horman@netronome.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jiri Benc <jbenc@redhat.com>, oss-drivers@netronome.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf 1/7] xdp: remove the xdp_attachment_flags_ok() callback
In-Reply-To: <20201203174217.7717ea84@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
References: <160703131710.162669.9632344967082582016.stgit@toke.dk>
 <160703131819.162669.2776807312730670823.stgit@toke.dk>
 <20201203174217.7717ea84@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 04 Dec 2020 10:38:06 +0100
Message-ID: <87o8j99aip.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Thu, 03 Dec 2020 22:35:18 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Since we offloaded and non-offloaded programs can co-exist there doesn't
>> really seem to be any reason for the check anyway, and it's only used in
>> three drivers so let's just get rid of the callback entirely.
>
> I don't remember exactly now, but I think the concern was that using=20
> the unspecified mode is pretty ambiguous when interface has multiple
> programs attached.

Right. I did scratch my head a bit for why the check was there in the
first place, but that makes sense, actually :)

So how about we disallow unload without specifying a mode, but only if
more than one program is loaded? Since the core code tracks all the
programs now, this could just be enforced there and we would avoid all
the weird interactions with the drivers trying to enforce it...

-Toke

