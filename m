Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33E842A5D5
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236821AbhJLNkj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 09:40:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbhJLNk3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 09:40:29 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECDA7F1;
        Tue, 12 Oct 2021 15:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634045903;
        bh=N8uxQ9NyAxZH3uOWCc3RVKPEmZO/5GjhQNo8ppobBpk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NOXMlHHmC9r1YQqn3/AS+C/ke3PWHkWUxqX0i63bDOek50htnnEa+TPKkx5eQgix1
         clTSeohfenCBS0rntuuMMhAeABgnLSXILOXfDmbbr8kGSgghIYbyhQKk/iuplJPbAO
         48tcOenYnYWUTnj7Liwsw/HcphUSzSDSe29CgDFE=
Subject: Re: [PATCH v5 5/8] drm/omap: Add global state as a private atomic
 object
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-6-narmstrong@baylibre.com>
 <2609ca32-90e8-1335-2769-14dcbcdfafde@ideasonboard.com>
 <ab06e379-1579-2352-3525-dbdca6a94f9b@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <00ad704f-cd01-cfc2-0418-1cb0561c41a5@ideasonboard.com>
Date:   Tue, 12 Oct 2021 16:38:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ab06e379-1579-2352-3525-dbdca6a94f9b@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/10/2021 16:23, Neil Armstrong wrote:

>>> +    struct drm_private_obj glob_obj;
>>> +
>>>        struct drm_fb_helper *fbdev;
>>>          struct workqueue_struct *wq;
>>> @@ -88,5 +105,9 @@ struct omap_drm_private {
>>>        void omap_debugfs_init(struct drm_minor *minor);
>>> +struct omap_global_state *__must_check
>>> +omap_get_global_state(struct drm_atomic_state *s);
>>> +struct omap_global_state *
>>> +omap_get_existing_global_state(struct omap_drm_private *priv);
>>
>> These could also be separated by empty lines. At least to my eyes it gets confusing if those declarations are not separated.
> 
> Atomic states can be extremely confusing, and hard to track.
> I checked and they do what they are documented for...
> 
> The omap_get_existing_global_state() is the most confusing since the result depends if
> we are in an atomic transaction of not.

So here I was just talking about the cosmetics, how the lines above look 
like. I have trouble seeing where the function declaration starts and 
where it ends without looking closely, as both lines of the declaration 
start at the first column, and there are no empty lines between the 
declarations.

But now that you mention, yes, the states are confusing =). And this 
series is somewhat difficult. I think it's important for future 
maintainability to include explanations and comments in this series for 
the confusing parts (plane-overlay mapping and state handling, mostly).

  Tomi
