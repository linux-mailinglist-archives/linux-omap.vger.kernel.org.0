Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABD644AE7E
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 14:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhKINNM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 08:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhKINNL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Nov 2021 08:13:11 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B739C061764
        for <linux-omap@vger.kernel.org>; Tue,  9 Nov 2021 05:10:25 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so2213222wmd.1
        for <linux-omap@vger.kernel.org>; Tue, 09 Nov 2021 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yikNNkxBfiIm0DXQK6Pq8Bnr+dOWNFCgKzTBRecZmFI=;
        b=H0ncPwO7kQeSxAFrKUsVT6kfw25EIoiGJl9l1Wyr9qxT0tFQidE4baB/NRMICe0CWO
         /vcaS+oSDLy+U1qJFAPRJ52kLOWkHEIzNsOTWQQlNm5Um1VcwDKcVb15YqRJBzEqYFVz
         vRhyd0T1EXSWK7UAd5TM0lPFwG1bmdj4F1QVK5Bqszmu5mifh8bOP4UsR58lyz1WBkOK
         ryRiOhAgFKa7O6v6AJp1zaAfMfM50YMyn38o5bjyB7zMMkTYFmW2txFq7Pov2oCvUvxx
         aHWCzUqopYSTFhs5oeVo9Xwu8JLHT8mbcE5PPpK07ebtOm+hn+FXXg8ic/PEuA4KoV0S
         caLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yikNNkxBfiIm0DXQK6Pq8Bnr+dOWNFCgKzTBRecZmFI=;
        b=O0j4OXUmr9paepV8zpMXvdgsHyWEUrL5Gja7d0P62Yh5iznxq3K9DoVCZ/MYOYsJBF
         XB208nKQ8gQnFeKD4uf8qp4KLwfGSaBeR8CgxWJZjXvdwFtqDN2pPDsk21s+HvLsThFU
         z97pBYgXcOAiBPFXTkBndMEJ//EjRbB1SM5oB/Ci7494nYEEACBTtVwtrIjnyD7V//Cm
         AUtuqMlKtNWKNAzkC455GiYl5GKOgFMzbJ8uSl9nG5ePeNr7WPQeAVPuUm1+sPTHT+sb
         9ZVBE6YJuz1/Y/6q+z9HUeCP57fekjXRZqIfKAjExK+vPK+EjgQ21n4mUnsH6VXUgaeZ
         2+Lw==
X-Gm-Message-State: AOAM533cEknLbwMlFc+qZ3z0VRDkZCzML7HWTZPpf4acqS0n7bcyA+KE
        qdUb+P16dev/1bNhaWo9kN8eXg==
X-Google-Smtp-Source: ABdhPJy+xB/zDOHk28KTlxwPff6bJqPBn4qkf9L1Y2Rmct5DtZGiq5O+wGyJl5iz/hBeViHd9SLqwQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr7102274wmk.152.1636463424142;
        Tue, 09 Nov 2021 05:10:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d284:de3f:b3d6:f714? ([2001:861:44c0:66c0:d284:de3f:b3d6:f714])
        by smtp.gmail.com with ESMTPSA id m20sm2660981wmq.11.2021.11.09.05.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:10:23 -0800 (PST)
Subject: Re: [PATCH v6 1/9] drm/omap: add sanity plane state check
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-2-narmstrong@baylibre.com>
 <ea3d01fd-b723-b245-90cc-c5874f95122c@ideasonboard.com>
 <d4985027-e448-4220-a558-f1063dc9691f@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e9892eb7-33d6-bb27-b2a0-736e2c326388@baylibre.com>
Date:   Tue, 9 Nov 2021 14:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d4985027-e448-4220-a558-f1063dc9691f@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/10/2021 10:30, Tomi Valkeinen wrote:
> On 27/10/2021 11:29, Tomi Valkeinen wrote:
>> On 18/10/2021 17:28, Neil Armstrong wrote:
>>> Call drm_atomic_helper_check_plane_state() from the plane
>>> atomic_check() callback in order to add plane state sanity
>>> checking.
>>>
>>> It will permit filtering out totally bad scaling factors, even
>>> if the real check are done later in the atomic commit.
>>
>> I think there's more to it: the function sets plane_state->visible, which is used in later patches.
> 
> Maybe that could be mentioned in a comment. But otherwise:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks, I'll update the comment to mention this.

Neil

> 
>  Tomi

